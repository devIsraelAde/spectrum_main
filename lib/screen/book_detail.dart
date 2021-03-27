// import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spectrum_library/model/books.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/view_model/download_provider.dart';
import 'package:spectrum_library/widgets/hexagon_shape.dart';
import 'package:provider/provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class BookDetail extends StatefulWidget {
  final BookDetails bookDetails;

  BookDetail({this.bookDetails});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  static const PLATFORM_CHANNEL =
      const MethodChannel('com.cloudware.ng/spectrum/platform_channel');
  DownloadProvider _downloadProvider;
  StreamSubscription<DataConnectionStatus> listener;
  var internetStatus = "";
  bool download;

  @override
  void initState() {
    super.initState();
    checkInternet();
    _downloadProvider = context.read<DownloadProvider>();

    download = false;
  }

  Response response;
  Dio dio = new Dio();

///////////////////////////////////////
///////PROGRESS INDICATOR STREAM //////
///////////////////////////////////////
  StreamController<int> progressStreamController = new StreamController();

  ////////////////////////////////////////////////
  //////////////////INTERNET CHECKER//////////////
  ////////////////////////////////////////////////
  Future checkInternet() async {
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");

    print("Last results: ${DataConnectionChecker().lastTryResults}");
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          internetStatus = "Internet connection restored";
          rebuildAllChildren(context);
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          internetStatus = "No internet connection";
          rebuildAllChildren(context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    listener.cancel();

    super.dispose();
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
      print('REBUILT');
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    // rebuildAllChildren(context);
    // checkInternet();
    return Scaffold(
      body: ValueListenableBuilder<Box<BookDetails>>(
        valueListenable: Hive.box<BookDetails>('books')
            .listenable(keys: [widget.bookDetails.book_id]),
        builder: (context, Box<BookDetails> box, widgets) => SafeArea(
          child: Column(
            children: <Widget>[
              HexagonShape(
                () {
                  Navigator.of(context).pop();
                },
                '${Constants.domainNameUrl}${widget.bookDetails.front_cover}',
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.bookDetails.book_title.contains('.epub')
                      ? widget.bookDetails.book_title.substring(
                          0, widget.bookDetails.book_title.lastIndexOf('.'))
                      : widget.bookDetails.book_title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff054D44),
                  ),
                ),
              ),
              SizedBox(height: 10.0),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                alignment: Alignment.center,
                height: 35.0,
                color: Colors.grey[300],
                child: Text(
                  'Author: ${widget.bookDetails.book_author}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff054D44)),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 190.0,
                    height: 40.0,
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xff054D44),
                    ),
                    child: FutureProvider(
                      create: (context) async =>
                          await _downloadProvider.getDownloadPath(
                              taskid: box
                                  .get(widget.bookDetails.book_id)
                                  .downloadedbookId),
                      builder: (context, child) {
                        return Consumer<DownloadTask>(
                          builder: (context, filepath, _) {
                            print(box.get(widget.bookDetails.book_id).status);
                            print('FILE PATH::: ${filepath}');
                            print(
                                'DOWNLOAD PROGRESS::: ${box.get(widget.bookDetails.book_id).progress}');

                            // RETURN
                            return StatefulBuilder(builder:
                                (BuildContext context,
                                    StateSetter stateSetter) {
                              return FutureBuilder(
                                  future: checkInternet(),
                                  builder: (_, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else {
                                      ///////////////////////////////////////////////////////////////////////////////////////
                                      // DOWNLOAD FILE, IF THE FILE HAVE NOT BEING DOWNLOADED AND INTERNET CONNECTION IS ON//
                                      ///////////////////////////////////////////////////////////////////////////////////////
                                      if (filepath == null &&
                                          snapshot.data ==
                                              DataConnectionStatus.connected) {
                                        print(
                                            'DATA ON, FILE NOT DOWNLOADED YET');

                                        download = false;

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .connected) {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));
                                              setState(() {
                                                download = true;
                                              });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    download
                                                        ? "Downloading"
                                                        : "Download",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: download
                                                      ? Container(
                                                          width: 10,
                                                          height: 10,
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .download_rounded,
                                                          color: Colors.green,
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                        //////////////////////////////////////////////////////////////////////////////////////////////
                                        // DON'T DOWNLOAD FILE, IF THE FILE HAVE NOT BEING DOWNLOADED AND INTERNET CONNECTION IS OFF//
                                        //////////////////////////////////////////////////////////////////////////////////////////////
                                      } else if (filepath == null &&
                                          snapshot.data ==
                                              DataConnectionStatus
                                                  .disconnected) {
                                        print(
                                            'DATA OFF, FILE NOT DOWNLOADED YET');

                                        download = false;

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .disconnected) {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                              setState(() {
                                                rebuildAllChildren(context);
                                              });
                                            } else {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));
                                              setState(() {
                                                download = true;
                                              });
                                            }
                                          },
                                          child: Container(
                                            // color: Colors.blue,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    download
                                                        ? "Downloading"
                                                        : "Download",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: download
                                                      ? Container(
                                                          width: 10,
                                                          height: 10,
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .download_rounded,
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      //////////////////////////////////////////////////////////////////////////////////////////////////
                                      // IF INTERNET IS ON OR NOT AND BOOK HAVE ALREADY BEING DOWNLOADED SHOW THE READ BUTTON AND OPEN//
                                      //////////////////////////////////////////////////////////////////////////////////////////////////
                                      else if ((snapshot.data ==
                                                  DataConnectionStatus
                                                      .connected ||
                                              snapshot.data ==
                                                  DataConnectionStatus
                                                      .disconnected) &&
                                          DownloadTaskStatus.from(box
                                                  .get(widget
                                                      .bookDetails.book_id)
                                                  .status) ==
                                              DownloadTaskStatus.complete) {
                                        print(
                                            'CONNECTION::: ${snapshot.data} FILE DOWNLOADED ALREADY');

                                        download = false;

                                        return FlatButton(
                                          onPressed: () async {
                                            try {
                                              await PLATFORM_CHANNEL
                                                  .invokeMethod('epub',
                                                      // call the native function
                                                      <String, dynamic>{
                                                    // data to be passed to the function
                                                    'epubfilepath':
                                                        filepath.savedDir +
                                                            '/' +
                                                            filepath.filename,
                                                  });
                                              // result hold the response from plaform calls
                                            } on PlatformException catch (error) {
                                              // handle error
                                              print('Error: $error'); // here
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    "Read Book",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.yellow,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.open_in_new_rounded,
                                                  color: Colors.yellowAccent,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      ///////////////////////////////////////////////////////////////////////////////
                                      // DOWNLOAD, IF DOWNLOAD WAS CANCELED OR FAILED AND INTERNET CONNECTION IS ON//
                                      ///////////////////////////////////////////////////////////////////////////////
                                      else if ((DownloadTaskStatus.from(box
                                                      .get(widget
                                                          .bookDetails.book_id)
                                                      .status) ==
                                                  DownloadTaskStatus.failed ||
                                              DownloadTaskStatus.from(box
                                                      .get(widget
                                                          .bookDetails.book_id)
                                                      .status) ==
                                                  DownloadTaskStatus.canceled)
                                          //              &&
                                          // snapshot.data ==
                                          //     DataConnectionStatus.connected
                                          ) {
                                        download = false;
                                        print(
                                            'INTERNET CHECK::: ${DataConnectionStatus.connected}');

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .connected) {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));
                                              print(
                                                  'DOWNLOAD PROGRESS CHECK::: ${box.get(widget.bookDetails.book_id).progress}');
                                              setState(() {
                                                download = true;
                                              });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                              setState(() {
                                                rebuildAllChildren(context);
                                              });
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    download
                                                        ? "Downloading"
                                                        : "Retry",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: download &&
                                                              snapshot.data ==
                                                                  DataConnectionStatus
                                                                      .connected
                                                          ? Colors.white
                                                          : Colors.deepOrange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: download &&
                                                          snapshot.data ==
                                                              DataConnectionStatus
                                                                  .connected
                                                      ? Container(
                                                          width: 10,
                                                          height: 10,
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Icon(
                                                          Icons.replay,
                                                          color:
                                                              Colors.deepOrange,
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      ///////////////////////////////////////////////////////////////////////////////////////
                                      // DONT'T DOWNLOAD, IF DOWNLOAD WAS CANCELED OR FAILED AND INTERNET CONNECTION IS OFF//
                                      ///////////////////////////////////////////////////////////////////////////////////////
                                      else if (DownloadTaskStatus.from(box
                                                      .get(widget
                                                          .bookDetails.book_id)
                                                      .status) ==
                                                  DownloadTaskStatus.failed ||
                                              DownloadTaskStatus.from(box
                                                      .get(widget
                                                          .bookDetails.book_id)
                                                      .status) ==
                                                  DownloadTaskStatus.canceled
                                          // &&
                                          // snapshot.data ==
                                          //     DataConnectionStatus
                                          //         .disconnected

                                          ) {
                                        print(
                                            'INTERNET CHECK::: ${DataConnectionStatus.disconnected}');

                                        download = false;

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .disconnected) {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            } else {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));

                                              setState(() {
                                                download = true;
                                              });
                                              print(
                                                  'CHECKING CLICKED DISCONNECTED STUFF FOR DOWNLOAD!!!!!!!!');
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    download
                                                        ? "Downloading"
                                                        : "Retry",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: download &&
                                                              snapshot.data ==
                                                                  DataConnectionStatus
                                                                      .connected
                                                          ? Colors.white
                                                          : Colors.deepOrange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: download &&
                                                          snapshot.data ==
                                                              DataConnectionStatus
                                                                  .connected
                                                      ? Container(
                                                          width: 10,
                                                          height: 10,
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Icon(
                                                          Icons.replay,
                                                          color:
                                                              Colors.deepOrange,
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      ///////////////////////////////////////////////
                                      /////////DOWNLOAD RUNNING//////////////////////
                                      ///////////////////////////////////////////////
                                      else if (DownloadTaskStatus.from(box
                                                  .get(widget
                                                      .bookDetails.book_id)
                                                  .status) ==
                                              DownloadTaskStatus.running &&
                                          snapshot.data ==
                                              DataConnectionStatus.connected) {
                                        print('DOWNLOAD RUNNING!!!!!');

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .connected) {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));
                                              setState(() {
                                                download = true;
                                              });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    "Downloading",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      ///////////////////////////////////////////////
                                      /////////DOWNLOAD PAUSED///////////////////////
                                      ///////////////////////////////////////////////
                                      else if (DownloadTaskStatus.from(box
                                              .get(widget.bookDetails.book_id)
                                              .status) ==
                                          DownloadTaskStatus.paused) {
                                        print('DOWNLOAD PAUSED!!!!!');

                                        return FlatButton(
                                          onPressed: () async {
                                            if (snapshot.data ==
                                                DataConnectionStatus
                                                    .connected) {
                                              _downloadProvider.requestDownload(
                                                  bookDetails: box.get(widget
                                                      .bookDetails.book_id));
                                              Scaffold.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Downloading...')));
                                              setState(() {
                                                download = true;
                                              });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    title: Text(
                                                      'No Internet Connection',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                        'Please connect your device to the internet to download.'),
                                                    backgroundColor:
                                                        Colors.white,
                                                    elevation: 10,
                                                    actions: [
                                                      Container(
                                                        child: FlatButton(
                                                          color:
                                                              Color(0xff054D44),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Okay',
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            }
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    download
                                                        ? "Downloading"
                                                        : "Retry",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Text('');
                                        // _downloadProvider.delete(bookDetails: box.get(widget.bookDetails.bookId));
                                      }
                                    }
                                  });
                            });
                          },
                        );
                      },
                    ),
                  ),

/*                SizedBox(width: 5.0),
                    Container(
                      width: 45.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),*/
                ],
              ),
//               SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 15.0),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       child: Text(
//                         widget.bookDetails.book_description,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 3,
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
// //                  Spacer(),
// /*                  Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 15.0, vertical: 10.0),
//                           child: Text('© All Rights Reserved'),
//                         ),
//                       ),*/
//                   ],
//                 ),
//               ),
            ],
          ),
        ),
      ),
    );
  }
}

// class LoadingProgress extends StatefulWidget {
//   const LoadingProgress({
//     Key key,
//     @required BookDetails book,
//   })  : book = book,
//         super(key: key);

//   final BookDetails book;

//   @override
//   _LoadingProgressState createState() => _LoadingProgressState();
// }

// class _LoadingProgressState extends State<LoadingProgress> {
//   CancelToken cancelToken;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     cancelToken = CancelToken();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // context.read<ApiServices>().downloadFile(book: widget.book, token: cancelToken);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.black.withOpacity(0.8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           AlertDialog(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             title: Text('Downloading...'),
//             content: Consumer<ApiServices>(
//               builder: (context, notifier, _) => Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   notifier.loading == '100%' ? Text('DONE') : LinearProgressIndicator(),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Text(notifier.loading ?? '0%'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(notifier.count ?? '0'),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                           child: Text('/'),
//                         ),
//                         Text(notifier.size ?? '0')
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   FlatButton(
//                     color: Colors.red,
//                     textColor: Colors.white,
//                     onPressed: () {
//                       Provider.of<ApiServices>(context, listen: false)
//                           .loadingprogress(progress: '0%', downloadsize: '0', downloadcount: '0');
//                       Navigator.pop(context);
//                       cancelToken.isCancelled ? null : cancelToken.cancel('cancelled');
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
