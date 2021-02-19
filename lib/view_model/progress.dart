import 'package:flutter/cupertino.dart';

class Progress with ChangeNotifier {
  String _progress;

  String get loading => _progress;

  loadingprogress({String progress}) {
    _progress = progress;
    notifyListeners();
  }
}
