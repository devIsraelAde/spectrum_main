import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';

class DownloadProvider extends ChangeNotifier {
  bool _permissionReady = false;
  String _localPath;

  final _dbphelper = DatabaseHelper();

  // Future<String> downloadFile({BookDetails book, CancelToken token}) async {
  //   PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  //   String progress;
  //   if (permission != PermissionStatus.granted) {
  //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     // startDownload(context, bookID, url, filename);
  //     final savepath = await getFilePath(filename: book.bookTitle.trim());
  //     progress = await downloadEpubFile(book: book, url: book.downloadLink, savepath: savepath, token: token);
  //     return progress;
  //   } else {
  //     final savepath = await getFilePath(filename: book.bookTitle.trim());
  //     progress = await downloadEpubFile(book: book, url: book.downloadLink, savepath: savepath, token: token);
  //     return progress;
  //     // startDownload(context, bookID, url, filename);
  //   }
  // }

  // Future<String> getFilePath({String filename}) async {
  //   String path;
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   path = '${dir.path}/.data/.spectrum/.limited/.library/.learn/.books/.files/.device/.app/.encrypt/$filename.epub';

  //   return path;
  // }

  // String _progress;
  // String _downloadsize;
  // String _downloadcount;

  // String get loading => _progress;
  // String get size => _downloadsize;
  // String get count => _downloadcount;

  // loadingprogress({String progress, String downloadsize, String downloadcount}) {
  //   _progress = progress;
  //   _downloadsize = downloadsize;
  //   _downloadcount = downloadcount;
  //   notifyListeners();
  // }

  // Future<String> downloadEpubFile({BookDetails book, String url, String savepath, CancelToken token}) async {
  //   // var crypt = AesCrypt("spectrumltd---&*()#@#@@>?<>+=${book.bookTitle}");
  //   try {
  //     final _dio = await getApiClient();
  //     String _progress;
  //     await _dio.download(url, savepath, onReceiveProgress: (received, total) async {
  //       print((received / total * 100).toStringAsFixed(0) + '%');

  //       // _progress = (received / total * 100).toStringAsFixed(0) + '%';
  //       // notifyListeners();
  //       if (total != -1) {
  //         loadingprogress(
  //             progress: (received / total * 100).toStringAsFixed(0) + '%',
  //             downloadsize: Constants.formatBytes(total, 1),
  //             downloadcount: Constants.formatBytes(received, 1));
  //         _progress = (received / total * 100).toStringAsFixed(0) + '%';
  //       }

  //       print('received : $received.toStringAsFixed(0) out of total :  ${total.toStringAsFixed(0)}');

  //       if (received.toStringAsFixed(0) == total.toString()) {
  //         // final newpath = await crypt.encryptFile(savepath);
  //         _dbphelper.updatebook(
  //           book: BookDetails(
  //               bookAuthor: book.bookAuthor,
  //               bookDescription: book.bookDescription,
  //               bookId: book.bookId,
  //               bookPath: savepath,
  //               frontCover: book.frontCover,
  //               datePublished: book.datePublished,
  //               downloadLink: book.downloadLink,
  //               bookPublisher: book.bookPublisher,
  //               bookTitle: book.bookTitle),
  //         );
  //       }
  //     }, cancelToken: token);
  //     return _progress;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void bindBackgroundIsolate() {
    ReceivePort _port = ReceivePort();
    bool isSuccess = IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }

    _port.asBroadcastStream().listen((dynamic data) async {
      // if (debug) {
      //   print('UI Isolate Callback: $data');
      // }
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      final task =
          await _dbphelper.getallbooks()?.then((value) => value.firstWhere((task) => task.downloadedbookId == id));
      if (task != null) {
        task.status = status.value;
        task.progress = progress;
        notifyListeners();
      }
    });
  }

  void unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    // if (debug) {
    //   print('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    // }
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  // Widget buildNoPermissionWarning() => Container(
  //       child: Center(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 24.0),
  //               child: Text(
  //                 'Please grant accessing storage permission to continue -_-',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 32.0,
  //             ),
  //             FlatButton(
  //                 onPressed: () {
  //                   _checkPermission().then((hasGranted) {
  //                     setState(() {
  //                       _permissionReady = hasGranted;
  //                     });
  //                   });
  //                 },
  //                 child: Text(
  //                   'Retry',
  //                   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
  //                 ))
  //           ],
  //         ),
  //       ),
  //     );



  void requestDownload({BookDetails bookDetails}) async {
    String taskId = await FlutterDownloader.enqueue(
        url: bookDetails.download_link,
        // fileName: bookDetails.bookTitle.trim(),
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
    _dbphelper.updatebook(
      book: BookDetails(
          book_author: bookDetails.book_author,
          book_description: bookDetails.book_description,
          book_id: bookDetails.book_id,
          downloadedbookId: taskId,
          status: bookDetails.status,
          progress: bookDetails.progress,
          front_cover: bookDetails.front_cover,
          date_published: bookDetails.date_published,
          download_link: bookDetails.download_link,
          book_publisher: bookDetails.book_publisher,
          book_title: bookDetails.book_title),
    );
    notifyListeners();
    // task.taskId = await FlutterDownloader.enqueue(
    //     url: task.link,
    //     headers: {"auth": "test_for_sql_encoding"},
    //     savedDir: _localPath,
    //     showNotification: true,
    //     openFileFromNotification: true);
  }

  void cancelDownload({BookDetails bookDetails}) async {
    await FlutterDownloader.cancel(taskId: bookDetails.downloadedbookId);
  }

  void pauseDownload({BookDetails bookDetails}) async {
    await FlutterDownloader.pause(taskId: bookDetails.downloadedbookId);
  }

  void resumeDownload({BookDetails bookdetails}) async {
    String newTaskId = await FlutterDownloader.resume(taskId: bookdetails.downloadedbookId);
    _dbphelper.updatebook(
      book: BookDetails(
          book_author: bookdetails.book_author,
          book_description: bookdetails.book_description,
          book_id: bookdetails.book_id,
          downloadedbookId: newTaskId,
          status: bookdetails.status,
          progress: bookdetails.progress,
          front_cover: bookdetails.front_cover,
          date_published: bookdetails.date_published,
          download_link: bookdetails.download_link,
          book_publisher: bookdetails.book_publisher,
          book_title: bookdetails.book_title),
    );
    notifyListeners();
  }

  void retryDownload({BookDetails bookdetails}) async {
    String newTaskId = await FlutterDownloader.retry(taskId: bookdetails.downloadedbookId);
    _dbphelper.updatebook(
      book: BookDetails(
          book_author: bookdetails.book_author,
          book_description: bookdetails.book_description,
          book_id: bookdetails.book_id,
          downloadedbookId: newTaskId,
          status: bookdetails.status,
          progress: bookdetails.progress,
          front_cover: bookdetails.front_cover,
          date_published: bookdetails.date_published,
          download_link: bookdetails.download_link,
          book_publisher: bookdetails.book_publisher,
          book_title: bookdetails.book_title),
    );
    notifyListeners();
  }

  Future<bool> openDownloadedFile({BookDetails bookDetails}) {
    return FlutterDownloader.open(taskId: bookDetails.downloadedbookId);
  }

  Future<DownloadTask> getDownloadPath({String taskid}) async {
    final tasks = await FlutterDownloader.loadTasks();
    print(tasks.where((element) => element.taskId == taskid).elementAt(0).savedDir);
    return tasks.where((element) => element.taskId == taskid).elementAt(0);
  }

  void delete({BookDetails bookDetails}) async {
    await FlutterDownloader.remove(taskId: bookDetails.downloadedbookId, shouldDeleteContent: true);
    await prepare();
    notifyListeners();
  }

  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<Null> prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    tasks?.forEach((task) async {
      final bookDetails = await _dbphelper.getallbooks();
      for (BookDetails bookdetails in bookDetails) {
        if (bookdetails.download_link == task.url) {
          _dbphelper.updatebook(
            book: BookDetails(
                book_author: bookdetails.book_author,
                book_description: bookdetails.book_description,
                book_id: bookdetails.book_id,
                downloadedbookId: task.taskId,
                status: task.status.value,
                progress: task.progress,
                front_cover: bookdetails.front_cover,
                date_published: bookdetails.date_published,
                download_link: bookdetails.download_link,
                book_publisher: bookdetails.book_publisher,
                book_title: bookdetails.book_title),
          );
          notifyListeners();
        }
      }
    });

    _permissionReady = await _checkPermission();

    _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'download';
    notifyListeners();

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String> _findLocalPath() async {
    final directory =
        Platform.isAndroid ? await getApplicationSupportDirectory() : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
