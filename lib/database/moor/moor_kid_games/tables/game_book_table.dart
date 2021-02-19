import 'package:moor_flutter/moor_flutter.dart';

class GameBook extends Table {
  String get tableName => 'gamebook';
  IntColumn get id => integer().named('bookid').autoIncrement()();
  TextColumn get uuid => text().named('uuid')();
  TextColumn get booktitle => text().named('title')();
  TextColumn get subject => text().named('subject')();
  TextColumn get cover => text().named('frontcover')();
  IntColumn get level => integer().named('booklevel')();
}
