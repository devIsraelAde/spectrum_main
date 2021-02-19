import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 12)
class Note {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String notes;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final bool bookmark;

  const Note({this.title , this.notes , this.date, this.bookmark});
}
