import 'package:moor_flutter/moor_flutter.dart';
import 'puzzle_table.dart';

class GameExample extends GamePuzzle {
  String get tableName => 'gameexample';
  // IntColumn get levelid => integer().customConstraint('NOT NULL REFERENCES gamelevel (levelid)')();
  IntColumn get id => integer().named('exampleid').autoIncrement()();
  // TextColumn get uuid => text().named('uuid').withLength(min: 6, max: 32)();
  // TextColumn get arithmetric => text().named('arithmetric').withLength(min: 1, max: 2)();
  // TextColumn get boxcount => text().named('boxcount')();
  // TextColumn get answer => text().named('answer')();
  // TextColumn get name => text().named('name')();
  // TextColumn get image => text().named('image')();
}
