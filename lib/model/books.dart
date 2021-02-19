import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model.dart';
import 'puzzle.dart';
part 'books.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(nullable: true)
class Books {
  const Books({
    this.message,
    this.data,
    this.status,
  });

  @HiveField(0)
  final String message;
  @HiveField(1)
  final BookData data;
  @HiveField(2)
  final int status;

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  Map<String, dynamic> toJson() => _$BooksToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable(nullable: true)
class BookData {
  BookData(
      {this.books,
      this.games,
      this.special_books,
      this.user,
      this.access_code_duration,
      this.activation_date,
      this.access_code_expiry});

  @HiveField(0)
  final List<BookDetails> books;
  final User user;
  @HiveField(1)
  final SpecialBooks special_books;
  @HiveField(2)
  final List<Game> games;
  @HiveField(3)
  final int access_code_duration;
  @HiveField(4)
  final DateTime activation_date;
  @HiveField(5)
  final DateTime access_code_expiry;

  factory BookData.fromJson(Map<String, dynamic> json) => _$BookDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookDataToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class SpecialBooks {
  const SpecialBooks({
    this.data,
  });

  @HiveField(0)
  final List<SpecialBooksData> data;

  factory SpecialBooks.fromJson(Map<String, dynamic> json) => _$SpecialBooksFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialBooksToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class SpecialBooksData {
  SpecialBooksData({
    this.id,
    this.uuid,
    this.title,
    this.author,
    this.subject,
    this.publisher,
    this.date_published,
    this.description,
    this.front_cover,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.level_count,
    this.pivot,
    // this.puzzles,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String uuid;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String author;
  @HiveField(4)
  final String subject;
  @HiveField(5)
  final String publisher;
  @HiveField(6)
  final DateTime date_published;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final String front_cover;
  @HiveField(9)
  final DateTime created_at;
  @HiveField(10)
  final DateTime updated_at;
  @HiveField(11)
  final dynamic deleted_at;
  @HiveField(12)
  final int level_count;
  @HiveField(13)
  final Pivot pivot;
  // @HiveField(14)
  // final List<Puzzle> puzzles;

  factory SpecialBooksData.fromJson(Map<String, dynamic> json) => _$SpecialBooksDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialBooksDataToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class Pivot {
  Pivot({
    this.access_code_id,
    this.special_book_uuid,
    this.created_at,
    this.updated_at,
  });

  @HiveField(1)
  final int access_code_id;
  @HiveField(2)
  final String special_book_uuid;
  @HiveField(3)
  final DateTime created_at;
  @HiveField(4)
  final DateTime updated_at;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable(nullable: true)
class BookDetails {
  BookDetails(
      {this.book_title,
      this.book_id,
      this.book_author,
      this.book_description,
      this.book_publisher,
      this.date_published,
      this.download_link,
      this.front_cover,
      this.progress,
      this.status,
      this.downloadedbookId});

  @HiveField(0)
  final String book_title;
  @HiveField(1)
  final int book_id;
  @HiveField(2)
  final String book_author;
  @HiveField(3)
  final String book_description;
  @HiveField(4)
  final String book_publisher;
  @HiveField(5)
  final DateTime date_published;
  @HiveField(6)
  final String download_link;
  @HiveField(7)
  final String front_cover;
  @HiveField(8)
  String downloadedbookId;
  @HiveField(9)
  int status;
  @HiveField(10)
  int progress;

  factory BookDetails.fromJson(Map<String, dynamic> json) => _$BookDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsToJson(this);
}

@HiveType(typeId: 6)
@JsonSerializable(nullable: true)
class Game {
  Game({
    this.game_id,
    this.title,
    this.instruction,
    this.download_link,
  });

  @HiveField(0)
  final int game_id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String instruction;
  @HiveField(3)
  final String download_link;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
