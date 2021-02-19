// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KidGamesAdapter extends TypeAdapter<KidGames> {
  @override
  final int typeId = 9;

  @override
  KidGames read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KidGames(
      level_count: fields[0] as int,
      data: fields[1] as PuzzleData,
    );
  }

  @override
  void write(BinaryWriter writer, KidGames obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.level_count)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KidGamesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PuzzleDataAdapter extends TypeAdapter<PuzzleData> {
  @override
  final int typeId = 10;

  @override
  PuzzleData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PuzzleData(
      introduction: (fields[0] as List)?.cast<Puzzle>(),
      examples: (fields[1] as List)?.cast<Puzzle>(),
      question: (fields[2] as List)?.cast<Puzzle>(),
    );
  }

  @override
  void write(BinaryWriter writer, PuzzleData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.introduction)
      ..writeByte(1)
      ..write(obj.examples)
      ..writeByte(2)
      ..write(obj.question);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PuzzleDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PuzzleAdapter extends TypeAdapter<Puzzle> {
  @override
  final int typeId = 11;

  @override
  Puzzle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Puzzle(
      id: fields[1] as int,
      uuid: fields[2] as String,
      book_id: fields[3] as String,
      subject: fields[4] as String,
      type: fields[5] as String,
      arithmetic_symbol: fields[6] as String,
      box_count: fields[7] as int,
      answer: fields[8] as int,
      level: fields[9] as int,
      name: fields[10] as String,
      image: fields[11] as String,
      created_at: fields[12] as DateTime,
      updated_at: fields[13] as DateTime,
      deleted_at: fields[14] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Puzzle obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.uuid)
      ..writeByte(3)
      ..write(obj.book_id)
      ..writeByte(4)
      ..write(obj.subject)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.arithmetic_symbol)
      ..writeByte(7)
      ..write(obj.box_count)
      ..writeByte(8)
      ..write(obj.answer)
      ..writeByte(9)
      ..write(obj.level)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.created_at)
      ..writeByte(13)
      ..write(obj.updated_at)
      ..writeByte(14)
      ..write(obj.deleted_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PuzzleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KidGames _$KidGamesFromJson(Map<String, dynamic> json) {
  return KidGames(
    level_count: json['level_count'] as int,
    data: json['data'] == null
        ? null
        : PuzzleData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KidGamesToJson(KidGames instance) => <String, dynamic>{
      'level_count': instance.level_count,
      'data': instance.data,
    };

PuzzleData _$PuzzleDataFromJson(Map<String, dynamic> json) {
  return PuzzleData(
    introduction: (json['introduction'] as List)
        ?.map((e) =>
            e == null ? null : Puzzle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    examples: (json['examples'] as List)
        ?.map((e) =>
            e == null ? null : Puzzle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    question: (json['question'] as List)
        ?.map((e) =>
            e == null ? null : Puzzle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PuzzleDataToJson(PuzzleData instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'examples': instance.examples,
      'question': instance.question,
    };

Puzzle _$PuzzleFromJson(Map<String, dynamic> json) {
  return Puzzle(
    id: json['id'] as int,
    uuid: json['uuid'] as String,
    book_id: json['book_id'] as String,
    subject: json['subject'] as String,
    type: json['type'] as String,
    arithmetic_symbol: json['arithmetic_symbol'] as String,
    box_count: json['box_count'] as int,
    answer: json['answer'] as int,
    level: json['level'] as int,
    name: json['name'] as String,
    image: json['image'] as String,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deleted_at: json['deleted_at'],
  );
}

Map<String, dynamic> _$PuzzleToJson(Puzzle instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'book_id': instance.book_id,
      'subject': instance.subject,
      'type': instance.type,
      'arithmetic_symbol': instance.arithmetic_symbol,
      'box_count': instance.box_count,
      'answer': instance.answer,
      'level': instance.level,
      'name': instance.name,
      'image': instance.image,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at,
    };
