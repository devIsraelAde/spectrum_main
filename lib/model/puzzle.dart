import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'puzzle.g.dart';

@JsonSerializable(nullable: true)
@HiveType(typeId: 9)
class KidGames {
  @HiveField(0)
  final int level_count;
  @HiveField(1)
  final PuzzleData data;

  const KidGames({this.level_count, this.data});

  factory KidGames.fromJson(Map<String, dynamic> json) => _$KidGamesFromJson(json);

  Map<String, dynamic> toJson() => _$KidGamesToJson(this);
}

@JsonSerializable(nullable: true)
@HiveType(typeId: 10)
class PuzzleData {
  @HiveField(0)
  final List<Puzzle> introduction;
  @HiveField(1)
  final List<Puzzle> examples;
  @HiveField(2)
  final List<Puzzle> question;

  const PuzzleData({this.introduction, this.examples, this.question});

  factory PuzzleData.fromJson(Map<String, dynamic> json) => _$PuzzleDataFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleDataToJson(this);
}

@JsonSerializable(nullable: true)
@HiveType(typeId: 11)
class Puzzle {
  Puzzle({
    this.id,
    this.uuid,
    this.book_id,
    this.subject,
    this.type,
    this.arithmetic_symbol,
    this.box_count,
    this.answer,
    this.level,
    this.name,
    this.image,
    this.created_at,
    this.updated_at,
    this.deleted_at,
  });

  @HiveField(1)
  final int id;
  @HiveField(2)
  final String uuid;
  @HiveField(3)
  final String book_id;
  @HiveField(4)
  final String subject;
  @HiveField(5)
  final String type;
  @HiveField(6)
  final String arithmetic_symbol;
  @HiveField(7)
  final int box_count;
  @HiveField(8)
  final int answer;
  @HiveField(9)
  final int level;
  @HiveField(10)
  final String name;
  @HiveField(11)
  final String image;
  @HiveField(12)
  final DateTime created_at;
  @HiveField(13)
  final DateTime updated_at;
  @HiveField(14)
  final dynamic deleted_at;

  factory Puzzle.fromJson(Map<String, dynamic> json) => _$PuzzleFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleToJson(this);
}
