import 'package:flutter/cupertino.dart';

class GameLevelNotifier extends ValueNotifier {
  GameLevelNotifier(value) : super(value);

  int _level;

  get getlevel => _level;

  movetoadifferentlevel({int level}) {
    _level = level;
    notifyListeners();
  }

  showalayout() {
    //todo: get data from db based on the level i.e. level is the key
  }
}
