import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/view_model/view_model.dart';
import 'package:spectrum_library/widgets/widget.dart';

class DownloadScreen extends StatefulWidget {
  static const routeName = '/download';

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  // List<DownloadTask> downloads;
  DownloadProvider _downloadProvider;

  static const PLATFORM_CHANNEL = const MethodChannel('com.cloudware.ng/spectrum/platform_channel');
  @override
  void initState() {
    super.initState();
    // downloads = Provider.of<List<DownloadTask>>(context);
    _downloadProvider = context.read<DownloadProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: StreamProvider<List<DownloadTask>>(
          initialData: [],
          create: (context) => FlutterDownloader.loadTasks().asStream(),
          builder: (context, widget) {
            return Consumer<List<DownloadTask>>(
              builder: (context, downloads, _) {
                print(downloads);
                return downloads?.isEmpty
                    ? Center(
                        child: Text(
                        'No Downloads Yet!',
                        style: TextStyle(fontSize: 20),
                      ))
                    : ListView.builder(
                        itemCount: downloads.length,
                        itemBuilder: (context, index) {
                          print(downloads.elementAt(index).progress);
                          print(downloads.elementAt(index).status.value);
                          final BookDetails bookDetails = context
                              .watch<DatabaseHelper>()
                              ?.getsinglebooksfordownload(downloadid: downloads?.elementAt(index)?.taskId);
                          if (bookDetails == null) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                // 'Error in a file',
                                '',
                                style: TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            );
                          } else {
                            return DownloadItem(
                                data: ItemHolder(
                                  name: downloads.elementAt(index)?.filename ?? ' Loading...',
                                  task: BookDetails(
                                      book_author: bookDetails.book_author ?? '',
                                      book_id: bookDetails.book_id ?? '',
                                      book_description: bookDetails.book_description ?? '',
                                      book_publisher: bookDetails.book_publisher ?? '',
                                      date_published: bookDetails.date_published ?? '',
                                      front_cover: bookDetails.front_cover ?? '',
                                      downloadedbookId: downloads.elementAt(index).taskId,
                                      book_title: downloads.elementAt(index).filename,
                                      download_link: downloads.elementAt(index).url,
                                      progress: downloads.elementAt(index).progress,
                                      status: downloads.elementAt(index).status.value),
                                ),
                                onItemClick: (task) async {
                                  if (downloads.elementAt(index).progress == 100) {
                                    try {
                                      await PLATFORM_CHANNEL.invokeMethod('epub', // call the native function
                                          <String, dynamic>{
                                            // data to be passed to the function
                                            'epubfilepath': downloads
                                                    .where((element) => element.taskId == task.downloadedbookId)
                                                    .elementAt(0)
                                                    .savedDir +
                                                '/' +
                                                downloads
                                                    .where((element) => element.taskId == task.downloadedbookId)
                                                    .elementAt(0)
                                                    .filename,
                                          });
                                      // result hold the response from plaform calls
                                    } on PlatformException catch (error) {
                                      // handle error
                                      print('Error: $error'); // here
                                    }
                                  }
                                  // _downloadProvider.openDownloadedFile(bookDetails: task).then((success) async {
                                  //   if (!success) {
                                  //     Scaffold.of(context).showSnackBar(SnackBar(content: Text('Cannot open this file')));
                                  //   } else {
                                  //     //todo: get the taskid in order to get the filepath
                                  //     // final filepath =
                                  //     //     await _downloadProvider.getDownloadPath(taskid: task.downloadedbookId);
                                  //     try {
                                  //       await PLATFORM_CHANNEL.invokeMethod('epub', // call the native function
                                  //           <String, dynamic>{
                                  //             // data to be passed to the function
                                  //             'epubfilepath': downloads
                                  //                 .where((element) => element.taskId == task.downloadedbookId)
                                  //                 .elementAt(0),
                                  //           });
                                  //       // result hold the response from plaform calls
                                  //     } on PlatformException catch (error) {
                                  //       // handle error
                                  //       print('Error: $error'); // here
                                  //     }
                                  //   }
                                  // });
                                },
                                onAtionClick: (task) {
                                  if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.undefined) {
                                    _downloadProvider.requestDownload(bookDetails: task);
                                  } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.running) {
                                    _downloadProvider.pauseDownload(bookDetails: task);
                                  } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.paused) {
                                    _downloadProvider.resumeDownload(bookdetails: task);
                                  } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.complete) {
                                    _downloadProvider.delete(bookDetails: task);
                                  } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.failed) {
                                    _downloadProvider.retryDownload(bookdetails: task);
                                  }
                                });
                          }
                        },
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
