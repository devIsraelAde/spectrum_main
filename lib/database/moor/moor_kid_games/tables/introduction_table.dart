import 'package:moor_flutter/moor_flutter.dart';

import 'puzzle_table.dart';

class GameIntroduction extends GamePuzzle {
  String get tableName => 'gameintroduction';
  IntColumn get id => integer().named('introductionid').autoIncrement()();
}
