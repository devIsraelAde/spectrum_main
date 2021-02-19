// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksAdapter extends TypeAdapter<Books> {
  @override
  final int typeId = 0;

  @override
  Books read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Books(
      message: fields[0] as String,
      data: fields[1] as BookData,
      status: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Books obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookDataAdapter extends TypeAdapter<BookData> {
  @override
  final int typeId = 1;

  @override
  BookData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookData(
      books: (fields[0] as List)?.cast<BookDetails>(),
      games: (fields[2] as List)?.cast<Game>(),
      special_books: fields[1] as SpecialBooks,
      access_code_duration: fields[3] as int,
      activation_date: fields[4] as DateTime,
      access_code_expiry: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BookData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.books)
      ..writeByte(1)
      ..write(obj.special_books)
      ..writeByte(2)
      ..write(obj.games)
      ..writeByte(3)
      ..write(obj.access_code_duration)
      ..writeByte(4)
      ..write(obj.activation_date)
      ..writeByte(5)
      ..write(obj.access_code_expiry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecialBooksAdapter extends TypeAdapter<SpecialBooks> {
  @override
  final int typeId = 2;

  @override
  SpecialBooks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialBooks(
      data: (fields[0] as List)?.cast<SpecialBooksData>(),
    );
  }

  @override
  void write(BinaryWriter writer, SpecialBooks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialBooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpecialBooksDataAdapter extends TypeAdapter<SpecialBooksData> {
  @override
  final int typeId = 3;

  @override
  SpecialBooksData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialBooksData(
      id: fields[0] as int,
      uuid: fields[1] as String,
      title: fields[2] as String,
      author: fields[3] as String,
      subject: fields[4] as String,
      publisher: fields[5] as String,
      date_published: fields[6] as DateTime,
      description: fields[7] as String,
      front_cover: fields[8] as String,
      created_at: fields[9] as DateTime,
      updated_at: fields[10] as DateTime,
      deleted_at: fields[11] as dynamic,
      level_count: fields[12] as int,
      pivot: fields[13] as Pivot,
    );
  }

  @override
  void write(BinaryWriter writer, SpecialBooksData obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.subject)
      ..writeByte(5)
      ..write(obj.publisher)
      ..writeByte(6)
      ..write(obj.date_published)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.front_cover)
      ..writeByte(9)
      ..write(obj.created_at)
      ..writeByte(10)
      ..write(obj.updated_at)
      ..writeByte(11)
      ..write(obj.deleted_at)
      ..writeByte(12)
      ..write(obj.level_count)
      ..writeByte(13)
      ..write(obj.pivot);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialBooksDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PivotAdapter extends TypeAdapter<Pivot> {
  @override
  final int typeId = 4;

  @override
  Pivot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pivot(
      access_code_id: fields[1] as int,
      special_book_uuid: fields[2] as String,
      created_at: fields[3] as DateTime,
      updated_at: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Pivot obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.access_code_id)
      ..writeByte(2)
      ..write(obj.special_book_uuid)
      ..writeByte(3)
      ..write(obj.created_at)
      ..writeByte(4)
      ..write(obj.updated_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PivotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookDetailsAdapter extends TypeAdapter<BookDetails> {
  @override
  final int typeId = 5;

  @override
  BookDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDetails(
      book_title: fields[0] as String,
      book_id: fields[1] as int,
      book_author: fields[2] as String,
      book_description: fields[3] as String,
      book_publisher: fields[4] as String,
      date_published: fields[5] as DateTime,
      download_link: fields[6] as String,
      front_cover: fields[7] as String,
      progress: fields[10] as int,
      status: fields[9] as int,
      downloadedbookId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookDetails obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.book_title)
      ..writeByte(1)
      ..write(obj.book_id)
      ..writeByte(2)
      ..write(obj.book_author)
      ..writeByte(3)
      ..write(obj.book_description)
      ..writeByte(4)
      ..write(obj.book_publisher)
      ..writeByte(5)
      ..write(obj.date_published)
      ..writeByte(6)
      ..write(obj.download_link)
      ..writeByte(7)
      ..write(obj.front_cover)
      ..writeByte(8)
      ..write(obj.downloadedbookId)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 6;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      game_id: fields[0] as int,
      title: fields[1] as String,
      instruction: fields[2] as String,
      download_link: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.game_id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.instruction)
      ..writeByte(3)
      ..write(obj.download_link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) {
  return Books(
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : BookData.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

BookData _$BookDataFromJson(Map<String, dynamic> json) {
  return BookData(
    books: (json['books'] as List)
        ?.map((e) =>
            e == null ? null : BookDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    games: (json['games'] as List)
        ?.map(
            (e) => e == null ? null : Game.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    special_books: json['special_books'] == null
        ? null
        : SpecialBooks.fromJson(json['special_books'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    access_code_duration: json['access_code_duration'] as int,
    activation_date: json['activation_date'] == null
        ? null
        : DateTime.parse(json['activation_date'] as String),
    access_code_expiry: json['access_code_expiry'] == null
        ? null
        : DateTime.parse(json['access_code_expiry'] as String),
  );
}

Map<String, dynamic> _$BookDataToJson(BookData instance) => <String, dynamic>{
      'books': instance.books,
      'user': instance.user,
      'special_books': instance.special_books,
      'games': instance.games,
      'access_code_duration': instance.access_code_duration,
      'activation_date': instance.activation_date?.toIso8601String(),
      'access_code_expiry': instance.access_code_expiry?.toIso8601String(),
    };

SpecialBooks _$SpecialBooksFromJson(Map<String, dynamic> json) {
  return SpecialBooks(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SpecialBooksData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpecialBooksToJson(SpecialBooks instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SpecialBooksData _$SpecialBooksDataFromJson(Map<String, dynamic> json) {
  return SpecialBooksData(
    id: json['id'] as int,
    uuid: json['uuid'] as String,
    title: json['title'] as String,
    author: json['author'] as String,
    subject: json['subject'] as String,
    publisher: json['publisher'] as String,
    date_published: json['date_published'] == null
        ? null
        : DateTime.parse(json['date_published'] as String),
    description: json['description'] as String,
    front_cover: json['front_cover'] as String,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deleted_at: json['deleted_at'],
    level_count: json['level_count'] as int,
    pivot: json['pivot'] == null
        ? null
        : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpecialBooksDataToJson(SpecialBooksData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'author': instance.author,
      'subject': instance.subject,
      'publisher': instance.publisher,
      'date_published': instance.date_published?.toIso8601String(),
      'description': instance.description,
      'front_cover': instance.front_cover,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at,
      'level_count': instance.level_count,
      'pivot': instance.pivot,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) {
  return Pivot(
    access_code_id: json['access_code_id'] as int,
    special_book_uuid: json['special_book_uuid'] as String,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'access_code_id': instance.access_code_id,
      'special_book_uuid': instance.special_book_uuid,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) {
  return BookDetails(
    book_title: json['book_title'] as String,
    book_id: json['book_id'] as int,
    book_author: json['book_author'] as String,
    book_description: json['book_description'] as String,
    book_publisher: json['book_publisher'] as String,
    date_published: json['date_published'] == null
        ? null
        : DateTime.parse(json['date_published'] as String),
    download_link: json['download_link'] as String,
    front_cover: json['front_cover'] as String,
    progress: json['progress'] as int,
    status: json['status'] as int,
    downloadedbookId: json['downloadedbookId'] as String,
  );
}

Map<String, dynamic> _$BookDetailsToJson(BookDetails instance) =>
    <String, dynamic>{
      'book_title': instance.book_title,
      'book_id': instance.book_id,
      'book_author': instance.book_author,
      'book_description': instance.book_description,
      'book_publisher': instance.book_publisher,
      'date_published': instance.date_published?.toIso8601String(),
      'download_link': instance.download_link,
      'front_cover': instance.front_cover,
      'downloadedbookId': instance.downloadedbookId,
      'status': instance.status,
      'progress': instance.progress,
    };

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    game_id: json['game_id'] as int,
    title: json['title'] as String,
    instruction: json['instruction'] as String,
    download_link: json['download_link'] as String,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'game_id': instance.game_id,
      'title': instance.title,
      'instruction': instance.instruction,
      'download_link': instance.download_link,
    };
