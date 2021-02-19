import 'package:moor_flutter/moor_flutter.dart';

class GameLevel extends Table {
  String get tableName => 'gamelevel';
  IntColumn get id => integer().named('levelid').autoIncrement()();
  // TextColumn get book => text().customConstraint('NOT NULL REFERENCES gamebook (bookid)')();
  // TextColumn get introduction => text().customConstraint('NOT NULL REFERENCES gameintroduction (introductionid)')();
  // TextColumn get example => text().customConstraint('NOT NULL REFERENCES gameexample (exampleid)')();
  // TextColumn get question => text().customConstraint('NOT NULL REFERENCES gamequestion (questionid)')();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
  IntColumn get totalscore => integer().named('totalscore')();
  IntColumn get currentscore => integer().named('currentscore')();
  BoolColumn get downloaded => boolean().withDefault(Constant(false))();
}
