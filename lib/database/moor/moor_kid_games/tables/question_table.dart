import 'package:moor_flutter/moor_flutter.dart';

import 'puzzle_table.dart';

class GameQuestion extends GamePuzzle {
  String get tableName => 'gamequestion';
  IntColumn get id => integer().named('gamequestionid').autoIncrement()();
}
