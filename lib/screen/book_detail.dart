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

class BookDetail extends StatefulWidget {
  final BookDetails bookDetails;
  BookDetail({this.bookDetails});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  static const PLATFORM_CHANNEL = const MethodChannel('com.cloudware.ng/spectrum/platform_channel');
  DownloadProvider _downloadProvider;

  @override
  void initState() {
    super.initState();
    _downloadProvider = context.read<DownloadProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<BookDetails>>(
        valueListenable: Hive.box<BookDetails>('books').listenable(keys: [widget.bookDetails.book_id]),
        builder: (context, Box<BookDetails> box, widgets) => SafeArea(
          child: Column(
            children: <Widget>[
              HexagonShape(
                () {
                  Navigator.of(context).pop();
                },
                '${Constants.domainNameUrl}${widget.bookDetails.front_cover}',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.bookDetails.book_title.contains('.epub')
                      ? widget.bookDetails.book_title.substring(0, widget.bookDetails.book_title.lastIndexOf('.'))
                      : widget.bookDetails.book_title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 170.0,
                    height: 40.0,
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Constants.primaryColor,
                      ),
                    ),
                    child: FutureProvider(
                      create: (context) async => await _downloadProvider.getDownloadPath(
                          taskid: box.get(widget.bookDetails.book_id).downloadedbookId),
                      builder: (context, child) {
                        return Consumer<DownloadTask>(
                          builder: (context, filepath, _) {
                            print(box.get(widget.bookDetails.book_id).status);
                            print(filepath);
                            if (filepath == null) {
                              return FlatButton(
                                onPressed: () async {
                                  _downloadProvider.requestDownload(bookDetails: box.get(widget.bookDetails.book_id));
                                  Scaffold.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(content: Text('Downloading...')));
                                },
                                child: Text(
                                  "Download",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              );
                            } else {
                              if (DownloadTaskStatus.from(box.get(widget.bookDetails.book_id).status) ==
                                  DownloadTaskStatus.undefined) {
                                return FlatButton(
                                  onPressed: () async {
                                    _downloadProvider.requestDownload(bookDetails: box.get(widget.bookDetails.book_id));
                                    Scaffold.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(SnackBar(content: Text('Downloading has started ...')));
                                  },
                                  child: Text(
                                    "Download",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                );
                              } else if (DownloadTaskStatus.from(box.get(widget.bookDetails.book_id).status) ==
                                  DownloadTaskStatus.running) {
                                return FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    "Downloading...",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                );

                                // _downloadProvider.pauseDownload(bookDetails: box.get(widget.bookDetails.bookId));
                              } else if (DownloadTaskStatus.from(box.get(widget.bookDetails.book_id).status) ==
                                  DownloadTaskStatus.paused) {
                                return FlatButton(
                                  onPressed: () async {
                                    _downloadProvider.requestDownload(bookDetails: box.get(widget.bookDetails.book_id));
                                    Scaffold.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                          SnackBar(content: Text('Sorry i think you paused the book download...')));
                                  },
                                  child: Text(
                                    "Downloading...",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                );

                                // _downloadProvider.resumeDownload(bookdetails: box.get(widget.bookDetails.bookId));
                              } else if (DownloadTaskStatus.from(box.get(widget.bookDetails.book_id).status) ==
                                      DownloadTaskStatus.failed ||
                                  DownloadTaskStatus.from(box.get(widget.bookDetails.book_id).status) ==
                                      DownloadTaskStatus.canceled) {
                                return FlatButton(
                                  onPressed: () async {
                                    _downloadProvider.requestDownload(bookDetails: box.get(widget.bookDetails.book_id));
                                    Scaffold.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                          SnackBar(content: Text('Sorry i think you paused the book download...')));
                                  },
                                  child: Text(
                                    "Failed...",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                );

                                // _downloadProvider.resumeDownload(bookdetails: box.get(widget.bookDetails.bookId));
                              } else {
                                return FlatButton(
                                  onPressed: () async {
                                    try {
                                      await PLATFORM_CHANNEL.invokeMethod('epub', // call the native function
                                          <String, dynamic>{
                                            // data to be passed to the function
                                            'epubfilepath': filepath.savedDir + '/' + filepath.filename,
                                          });
                                      // result hold the response from plaform calls
                                    } on PlatformException catch (error) {
                                      // handle error
                                      print('Error: $error'); // here
                                    }
                                  },
                                  child: Text(
                                    "Read Book",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                );
                                // _downloadProvider.delete(bookDetails: box.get(widget.bookDetails.bookId));
                              }
                              // else if (box.get(widget.bookDetails.bookId).status == DownloadTaskStatus.failed) {
                              //   _downloadProvider.retryDownload(bookdetails: box.get(widget.bookDetails.bookId));
                              // }
                            }
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
              SizedBox(height: 15.0),
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        widget.bookDetails.book_description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
//                  Spacer(),
/*                  Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Text('© All Rights Reserved'),
                        ),
                      ),*/
                  ],
                ),
              ),
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
