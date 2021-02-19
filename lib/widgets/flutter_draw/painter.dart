import 'package:flutter/widgets.dart' hide Image;
import 'package:spectrum_library/view_model/view_model.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'data/data.dart';
import 'package:spectrum_library/model/path_history.dart';

class Painter extends StatefulWidget {
  final PainterController painterController;

  Painter(PainterController painterController)
      : this.painterController = painterController,
        super(key: new ValueKey<PainterController>(painterController));

  @override
  _PainterState createState() => new _PainterState();
}

class _PainterState extends State<Painter> {
  bool _finished;

  @override
  void initState() {
    super.initState();
    _finished = false;
    widget.painterController.widgetFinish = _finish;
  }

  Size _finish() {
    setState(() {
      _finished = true;
    });
    return context.size;
  }

  @override
  Widget build(BuildContext context) {
    Widget child = new CustomPaint(
      willChange: true,
      painter: new _PainterPainter(widget.painterController.pathHistory, repaint: widget.painterController),
    );
    child = new ClipRect(child: child);
    if (!_finished) {
      child = new GestureDetector(
        child: child,
        onPanStart: (DragStartDetails start) {
          Offset pos = (context.findRenderObject() as RenderBox).globalToLocal(start.globalPosition);
          widget.painterController.pathHistory.add(pos);
          widget.painterController.notifyListeners();
        },
        onPanUpdate: (DragUpdateDetails update) {
          Offset pos = (context.findRenderObject() as RenderBox).globalToLocal(update.globalPosition);
          widget.painterController.pathHistory.updateCurrent(pos);
          widget.painterController.notifyListeners();
        },
        onPanEnd: (DragEndDetails end) {
          widget.painterController.pathHistory.endCurrent();
          widget.painterController.notifyListeners();
        },
      );
    }
    return new Container(
      child: child,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

class _PainterPainter extends CustomPainter {
  final PathHistory _path;

  _PainterPainter(this._path, {Listenable repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);
  }

  @override
  bool shouldRepaint(_PainterPainter oldDelegate) {
    return true;
  }
}
