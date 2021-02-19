import 'package:moor_flutter/moor_flutter.dart';

class GamePuzzle extends Table {
  IntColumn get levelid => integer().customConstraint('NOT NULL REFERENCES gamelevel (levelid)')();
  TextColumn get uuid => text().named('uuid').withLength(min: 6, max: 32)();
  TextColumn get arithmetric => text().named('arithmetric').withLength(min: 1, max: 2)();
  TextColumn get boxcount => text().named('boxcount')();
  TextColumn get answer => text().named('answer')();
  TextColumn get name => text().named('name')();
  TextColumn get image => text().named('image')();
}
