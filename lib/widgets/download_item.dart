import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:spectrum_library/model/model.dart';

class DownloadItem extends StatelessWidget {
  final ItemHolder data;
  final Function(BookDetails) onItemClick;
  final Function(BookDetails) onAtionClick;

  DownloadItem({this.data, this.onItemClick, this.onAtionClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: InkWell(
        onTap:  DownloadTaskStatus.from(data.task.status) == DownloadTaskStatus.complete
            ? () {
                onItemClick(data.task);
              }
            : null,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 64.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      data.name.contains('.epub') ? data.name.substring(0, data.name.lastIndexOf('.')) : data.name,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ActionForTaskUI(
                      task: data.task,
                      onAtionClick: onAtionClick,
                    ),
                  ),
                ],
              ),
            ),
            DownloadTaskStatus.from(data.task.status) == DownloadTaskStatus.running ||
                    DownloadTaskStatus.from(data.task.status) == DownloadTaskStatus.paused
                ? Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: LinearProgressIndicator(
                      value: data.task.progress / 100,
                    ),
                  )
                : Container()
          ].where((child) => child != null).toList(),
        ),
      ),
    );
  }
}

class ActionForTaskUI extends StatelessWidget {
  final BookDetails task;
  final Function(BookDetails) onAtionClick;

  ActionForTaskUI({this.task, this.onAtionClick});
  @override
  Widget build(BuildContext context) {
    if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.undefined) {
      return RawMaterialButton(
        onPressed: () {
          onAtionClick(task);
        },
        child: Icon(Icons.file_download),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.running) {
      return RawMaterialButton(
        onPressed: () {
          onAtionClick(task);
        },
        child: Icon(
          Icons.pause,
          color: Colors.red,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.paused) {
      return RawMaterialButton(
        onPressed: () {
          onAtionClick(task);
        },
        child: Icon(
          Icons.play_arrow,
          color: Colors.green,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.complete) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              'Open',
              // 'Ready',
              style: TextStyle(color: Colors.green),
            ),
          ),
          // RawMaterialButton(
          //   onPressed: () {
          //     onAtionClick(task);
          //   },
          //   child: Icon(
          //     Icons.delete_forever,
          //     color: Colors.red,
          //   ),
          //   shape: CircleBorder(),
          //   constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          // )
        ],
      );
    } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.canceled) {
      return Text('Canceled', style: TextStyle(color: Colors.red));
    } else if (DownloadTaskStatus.from(task.status) == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Failed', style: TextStyle(color: Colors.red)),
          RawMaterialButton(
            onPressed: () {
              onAtionClick(task);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.green,
            ),
            shape: CircleBorder(),
            constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else {
      return null;
    }
  }
}
