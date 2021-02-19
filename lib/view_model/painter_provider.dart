import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/flutter_draw/data/data.dart';
import 'package:spectrum_library/widgets/flutter_draw/painter.dart';

class PainterController extends ChangeNotifier {
  Color _drawColor = selectedColor;
  Color _backgroundColor = new Color.fromARGB(255, 255, 255, 255);

  double _thickness = 1.0;
  PictureDetails _cached;
  PathHistory pathHistory;
  ValueGetter<Size> widgetFinish;

  PainterController() {
    pathHistory = PathHistory();
  }

  Color get drawColor => _drawColor;

  set drawColor(Color color) {
    _drawColor = color;
    _updatePaint();
  }

  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color color) {
    _backgroundColor = color;
    _updatePaint();
  }

  double get thickness => _thickness;

  set thickness(double t) {
    _thickness = t;
    _updatePaint();
  }

  void _updatePaint() {
    Paint paint = new Paint();
    paint.color = drawColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = thickness;
    pathHistory.currentPaint = paint;
    pathHistory.setBackgroundColor(backgroundColor);
    notifyListeners();
  }

  void undo() {
    if (!isFinished()) {
      pathHistory.undo();
      notifyListeners();
    }
  }

  // void notifyListeners() {
  //   notifyListeners();
  // }

  void clear() {
    if (!isFinished()) {
      pathHistory.clear();
      notifyListeners();
    }
  }

  PictureDetails finish() {
    if (!isFinished()) {
      _cached = _render(widgetFinish());
    }
    return _cached;
  }

  PictureDetails _render(Size size) {
    PictureRecorder recorder = new PictureRecorder();
    Canvas canvas = new Canvas(recorder);
    pathHistory.draw(canvas, size);
    return new PictureDetails(recorder.endRecording(), size.width.floor(), size.height.floor());
  }

  bool isFinished() {
    return _cached != null;
  }
}
