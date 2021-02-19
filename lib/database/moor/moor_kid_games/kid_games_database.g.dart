// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kid_games_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GameBookData extends DataClass implements Insertable<GameBookData> {
  final int id;
  final String uuid;
  final String booktitle;
  final String subject;
  final String cover;
  final int level;
  GameBookData(
      {@required this.id,
      @required this.uuid,
      @required this.booktitle,
      @required this.subject,
      @required this.cover,
      @required this.level});
  factory GameBookData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GameBookData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}bookid']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      booktitle:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      subject:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}subject']),
      cover: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}frontcover']),
      level:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}booklevel']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['bookid'] = Variable<int>(id);
    }
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || booktitle != null) {
      map['title'] = Variable<String>(booktitle);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    if (!nullToAbsent || cover != null) {
      map['frontcover'] = Variable<String>(cover);
    }
    if (!nullToAbsent || level != null) {
      map['booklevel'] = Variable<int>(level);
    }
    return map;
  }

  GameBookCompanion toCompanion(bool nullToAbsent) {
    return GameBookCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      booktitle: booktitle == null && nullToAbsent
          ? const Value.absent()
          : Value(booktitle),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
    );
  }

  factory GameBookData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GameBookData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      booktitle: serializer.fromJson<String>(json['booktitle']),
      subject: serializer.fromJson<String>(json['subject']),
      cover: serializer.fromJson<String>(json['cover']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'booktitle': serializer.toJson<String>(booktitle),
      'subject': serializer.toJson<String>(subject),
      'cover': serializer.toJson<String>(cover),
      'level': serializer.toJson<int>(level),
    };
  }

  GameBookData copyWith(
          {int id,
          String uuid,
          String booktitle,
          String subject,
          String cover,
          int level}) =>
      GameBookData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        booktitle: booktitle ?? this.booktitle,
        subject: subject ?? this.subject,
        cover: cover ?? this.cover,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('GameBookData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('booktitle: $booktitle, ')
          ..write('subject: $subject, ')
          ..write('cover: $cover, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              booktitle.hashCode,
              $mrjc(
                  subject.hashCode, $mrjc(cover.hashCode, level.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameBookData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.booktitle == this.booktitle &&
          other.subject == this.subject &&
          other.cover == this.cover &&
          other.level == this.level);
}

class GameBookCompanion extends UpdateCompanion<GameBookData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> booktitle;
  final Value<String> subject;
  final Value<String> cover;
  final Value<int> level;
  const GameBookCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.booktitle = const Value.absent(),
    this.subject = const Value.absent(),
    this.cover = const Value.absent(),
    this.level = const Value.absent(),
  });
  GameBookCompanion.insert({
    this.id = const Value.absent(),
    @required String uuid,
    @required String booktitle,
    @required String subject,
    @required String cover,
    @required int level,
  })  : uuid = Value(uuid),
        booktitle = Value(booktitle),
        subject = Value(subject),
        cover = Value(cover),
        level = Value(level);
  static Insertable<GameBookData> custom({
    Expression<int> id,
    Expression<String> uuid,
    Expression<String> booktitle,
    Expression<String> subject,
    Expression<String> cover,
    Expression<int> level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'bookid': id,
      if (uuid != null) 'uuid': uuid,
      if (booktitle != null) 'title': booktitle,
      if (subject != null) 'subject': subject,
      if (cover != null) 'frontcover': cover,
      if (level != null) 'booklevel': level,
    });
  }

  GameBookCompanion copyWith(
      {Value<int> id,
      Value<String> uuid,
      Value<String> booktitle,
      Value<String> subject,
      Value<String> cover,
      Value<int> level}) {
    return GameBookCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      booktitle: booktitle ?? this.booktitle,
      subject: subject ?? this.subject,
      cover: cover ?? this.cover,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['bookid'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (booktitle.present) {
      map['title'] = Variable<String>(booktitle.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (cover.present) {
      map['frontcover'] = Variable<String>(cover.value);
    }
    if (level.present) {
      map['booklevel'] = Variable<int>(level.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameBookCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('booktitle: $booktitle, ')
          ..write('subject: $subject, ')
          ..write('cover: $cover, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }
}

class $GameBookTable extends GameBook
    with TableInfo<$GameBookTable, GameBookData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameBookTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('bookid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn(
      'uuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _booktitleMeta = const VerificationMeta('booktitle');
  GeneratedTextColumn _booktitle;
  @override
  GeneratedTextColumn get booktitle => _booktitle ??= _constructBooktitle();
  GeneratedTextColumn _constructBooktitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subjectMeta = const VerificationMeta('subject');
  GeneratedTextColumn _subject;
  @override
  GeneratedTextColumn get subject => _subject ??= _constructSubject();
  GeneratedTextColumn _constructSubject() {
    return GeneratedTextColumn(
      'subject',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedTextColumn _cover;
  @override
  GeneratedTextColumn get cover => _cover ??= _constructCover();
  GeneratedTextColumn _constructCover() {
    return GeneratedTextColumn(
      'frontcover',
      $tableName,
      false,
    );
  }

  final VerificationMeta _levelMeta = const VerificationMeta('level');
  GeneratedIntColumn _level;
  @override
  GeneratedIntColumn get level => _level ??= _constructLevel();
  GeneratedIntColumn _constructLevel() {
    return GeneratedIntColumn(
      'booklevel',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, uuid, booktitle, subject, cover, level];
  @override
  $GameBookTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gamebook';
  @override
  final String actualTableName = 'gamebook';
  @override
  VerificationContext validateIntegrity(Insertable<GameBookData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bookid')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['bookid'], _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(_booktitleMeta,
          booktitle.isAcceptableOrUnknown(data['title'], _booktitleMeta));
    } else if (isInserting) {
      context.missing(_booktitleMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject'], _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('frontcover')) {
      context.handle(_coverMeta,
          cover.isAcceptableOrUnknown(data['frontcover'], _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('booklevel')) {
      context.handle(_levelMeta,
          level.isAcceptableOrUnknown(data['booklevel'], _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameBookData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameBookData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GameBookTable createAlias(String alias) {
    return $GameBookTable(_db, alias);
  }
}

class GameIntroductionData extends DataClass
    implements Insertable<GameIntroductionData> {
  final int levelid;
  final String uuid;
  final String arithmetric;
  final String boxcount;
  final String answer;
  final String name;
  final String image;
  final int id;
  GameIntroductionData(
      {@required this.levelid,
      @required this.uuid,
      @required this.arithmetric,
      @required this.boxcount,
      @required this.answer,
      @required this.name,
      @required this.image,
      @required this.id});
  factory GameIntroductionData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GameIntroductionData(
      levelid:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}levelid']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      arithmetric: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}arithmetric']),
      boxcount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}boxcount']),
      answer:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}answer']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}introductionid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || levelid != null) {
      map['levelid'] = Variable<int>(levelid);
    }
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || arithmetric != null) {
      map['arithmetric'] = Variable<String>(arithmetric);
    }
    if (!nullToAbsent || boxcount != null) {
      map['boxcount'] = Variable<String>(boxcount);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String>(answer);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || id != null) {
      map['introductionid'] = Variable<int>(id);
    }
    return map;
  }

  GameIntroductionCompanion toCompanion(bool nullToAbsent) {
    return GameIntroductionCompanion(
      levelid: levelid == null && nullToAbsent
          ? const Value.absent()
          : Value(levelid),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      arithmetric: arithmetric == null && nullToAbsent
          ? const Value.absent()
          : Value(arithmetric),
      boxcount: boxcount == null && nullToAbsent
          ? const Value.absent()
          : Value(boxcount),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory GameIntroductionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GameIntroductionData(
      levelid: serializer.fromJson<int>(json['levelid']),
      uuid: serializer.fromJson<String>(json['uuid']),
      arithmetric: serializer.fromJson<String>(json['arithmetric']),
      boxcount: serializer.fromJson<String>(json['boxcount']),
      answer: serializer.fromJson<String>(json['answer']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'levelid': serializer.toJson<int>(levelid),
      'uuid': serializer.toJson<String>(uuid),
      'arithmetric': serializer.toJson<String>(arithmetric),
      'boxcount': serializer.toJson<String>(boxcount),
      'answer': serializer.toJson<String>(answer),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'id': serializer.toJson<int>(id),
    };
  }

  GameIntroductionData copyWith(
          {int levelid,
          String uuid,
          String arithmetric,
          String boxcount,
          String answer,
          String name,
          String image,
          int id}) =>
      GameIntroductionData(
        levelid: levelid ?? this.levelid,
        uuid: uuid ?? this.uuid,
        arithmetric: arithmetric ?? this.arithmetric,
        boxcount: boxcount ?? this.boxcount,
        answer: answer ?? this.answer,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('GameIntroductionData(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      levelid.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              arithmetric.hashCode,
              $mrjc(
                  boxcount.hashCode,
                  $mrjc(
                      answer.hashCode,
                      $mrjc(name.hashCode,
                          $mrjc(image.hashCode, id.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameIntroductionData &&
          other.levelid == this.levelid &&
          other.uuid == this.uuid &&
          other.arithmetric == this.arithmetric &&
          other.boxcount == this.boxcount &&
          other.answer == this.answer &&
          other.name == this.name &&
          other.image == this.image &&
          other.id == this.id);
}

class GameIntroductionCompanion extends UpdateCompanion<GameIntroductionData> {
  final Value<int> levelid;
  final Value<String> uuid;
  final Value<String> arithmetric;
  final Value<String> boxcount;
  final Value<String> answer;
  final Value<String> name;
  final Value<String> image;
  final Value<int> id;
  const GameIntroductionCompanion({
    this.levelid = const Value.absent(),
    this.uuid = const Value.absent(),
    this.arithmetric = const Value.absent(),
    this.boxcount = const Value.absent(),
    this.answer = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.id = const Value.absent(),
  });
  GameIntroductionCompanion.insert({
    @required int levelid,
    @required String uuid,
    @required String arithmetric,
    @required String boxcount,
    @required String answer,
    @required String name,
    @required String image,
    this.id = const Value.absent(),
  })  : levelid = Value(levelid),
        uuid = Value(uuid),
        arithmetric = Value(arithmetric),
        boxcount = Value(boxcount),
        answer = Value(answer),
        name = Value(name),
        image = Value(image);
  static Insertable<GameIntroductionData> custom({
    Expression<int> levelid,
    Expression<String> uuid,
    Expression<String> arithmetric,
    Expression<String> boxcount,
    Expression<String> answer,
    Expression<String> name,
    Expression<String> image,
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (levelid != null) 'levelid': levelid,
      if (uuid != null) 'uuid': uuid,
      if (arithmetric != null) 'arithmetric': arithmetric,
      if (boxcount != null) 'boxcount': boxcount,
      if (answer != null) 'answer': answer,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (id != null) 'introductionid': id,
    });
  }

  GameIntroductionCompanion copyWith(
      {Value<int> levelid,
      Value<String> uuid,
      Value<String> arithmetric,
      Value<String> boxcount,
      Value<String> answer,
      Value<String> name,
      Value<String> image,
      Value<int> id}) {
    return GameIntroductionCompanion(
      levelid: levelid ?? this.levelid,
      uuid: uuid ?? this.uuid,
      arithmetric: arithmetric ?? this.arithmetric,
      boxcount: boxcount ?? this.boxcount,
      answer: answer ?? this.answer,
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (levelid.present) {
      map['levelid'] = Variable<int>(levelid.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (arithmetric.present) {
      map['arithmetric'] = Variable<String>(arithmetric.value);
    }
    if (boxcount.present) {
      map['boxcount'] = Variable<String>(boxcount.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (id.present) {
      map['introductionid'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameIntroductionCompanion(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $GameIntroductionTable extends GameIntroduction
    with TableInfo<$GameIntroductionTable, GameIntroductionData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameIntroductionTable(this._db, [this._alias]);
  final VerificationMeta _levelidMeta = const VerificationMeta('levelid');
  GeneratedIntColumn _levelid;
  @override
  GeneratedIntColumn get levelid => _levelid ??= _constructLevelid();
  GeneratedIntColumn _constructLevelid() {
    return GeneratedIntColumn('levelid', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES gamelevel (levelid)');
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _arithmetricMeta =
      const VerificationMeta('arithmetric');
  GeneratedTextColumn _arithmetric;
  @override
  GeneratedTextColumn get arithmetric =>
      _arithmetric ??= _constructArithmetric();
  GeneratedTextColumn _constructArithmetric() {
    return GeneratedTextColumn('arithmetric', $tableName, false,
        minTextLength: 1, maxTextLength: 2);
  }

  final VerificationMeta _boxcountMeta = const VerificationMeta('boxcount');
  GeneratedTextColumn _boxcount;
  @override
  GeneratedTextColumn get boxcount => _boxcount ??= _constructBoxcount();
  GeneratedTextColumn _constructBoxcount() {
    return GeneratedTextColumn(
      'boxcount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  GeneratedTextColumn _answer;
  @override
  GeneratedTextColumn get answer => _answer ??= _constructAnswer();
  GeneratedTextColumn _constructAnswer() {
    return GeneratedTextColumn(
      'answer',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('introductionid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [levelid, uuid, arithmetric, boxcount, answer, name, image, id];
  @override
  $GameIntroductionTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gameintroduction';
  @override
  final String actualTableName = 'gameintroduction';
  @override
  VerificationContext validateIntegrity(
      Insertable<GameIntroductionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('levelid')) {
      context.handle(_levelidMeta,
          levelid.isAcceptableOrUnknown(data['levelid'], _levelidMeta));
    } else if (isInserting) {
      context.missing(_levelidMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('arithmetric')) {
      context.handle(
          _arithmetricMeta,
          arithmetric.isAcceptableOrUnknown(
              data['arithmetric'], _arithmetricMeta));
    } else if (isInserting) {
      context.missing(_arithmetricMeta);
    }
    if (data.containsKey('boxcount')) {
      context.handle(_boxcountMeta,
          boxcount.isAcceptableOrUnknown(data['boxcount'], _boxcountMeta));
    } else if (isInserting) {
      context.missing(_boxcountMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer'], _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('introductionid')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['introductionid'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameIntroductionData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameIntroductionData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GameIntroductionTable createAlias(String alias) {
    return $GameIntroductionTable(_db, alias);
  }
}

class GameExampleData extends DataClass implements Insertable<GameExampleData> {
  final int levelid;
  final String uuid;
  final String arithmetric;
  final String boxcount;
  final String answer;
  final String name;
  final String image;
  final int id;
  GameExampleData(
      {@required this.levelid,
      @required this.uuid,
      @required this.arithmetric,
      @required this.boxcount,
      @required this.answer,
      @required this.name,
      @required this.image,
      @required this.id});
  factory GameExampleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GameExampleData(
      levelid:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}levelid']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      arithmetric: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}arithmetric']),
      boxcount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}boxcount']),
      answer:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}answer']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}exampleid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || levelid != null) {
      map['levelid'] = Variable<int>(levelid);
    }
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || arithmetric != null) {
      map['arithmetric'] = Variable<String>(arithmetric);
    }
    if (!nullToAbsent || boxcount != null) {
      map['boxcount'] = Variable<String>(boxcount);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String>(answer);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || id != null) {
      map['exampleid'] = Variable<int>(id);
    }
    return map;
  }

  GameExampleCompanion toCompanion(bool nullToAbsent) {
    return GameExampleCompanion(
      levelid: levelid == null && nullToAbsent
          ? const Value.absent()
          : Value(levelid),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      arithmetric: arithmetric == null && nullToAbsent
          ? const Value.absent()
          : Value(arithmetric),
      boxcount: boxcount == null && nullToAbsent
          ? const Value.absent()
          : Value(boxcount),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory GameExampleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GameExampleData(
      levelid: serializer.fromJson<int>(json['levelid']),
      uuid: serializer.fromJson<String>(json['uuid']),
      arithmetric: serializer.fromJson<String>(json['arithmetric']),
      boxcount: serializer.fromJson<String>(json['boxcount']),
      answer: serializer.fromJson<String>(json['answer']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'levelid': serializer.toJson<int>(levelid),
      'uuid': serializer.toJson<String>(uuid),
      'arithmetric': serializer.toJson<String>(arithmetric),
      'boxcount': serializer.toJson<String>(boxcount),
      'answer': serializer.toJson<String>(answer),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'id': serializer.toJson<int>(id),
    };
  }

  GameExampleData copyWith(
          {int levelid,
          String uuid,
          String arithmetric,
          String boxcount,
          String answer,
          String name,
          String image,
          int id}) =>
      GameExampleData(
        levelid: levelid ?? this.levelid,
        uuid: uuid ?? this.uuid,
        arithmetric: arithmetric ?? this.arithmetric,
        boxcount: boxcount ?? this.boxcount,
        answer: answer ?? this.answer,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('GameExampleData(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      levelid.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              arithmetric.hashCode,
              $mrjc(
                  boxcount.hashCode,
                  $mrjc(
                      answer.hashCode,
                      $mrjc(name.hashCode,
                          $mrjc(image.hashCode, id.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameExampleData &&
          other.levelid == this.levelid &&
          other.uuid == this.uuid &&
          other.arithmetric == this.arithmetric &&
          other.boxcount == this.boxcount &&
          other.answer == this.answer &&
          other.name == this.name &&
          other.image == this.image &&
          other.id == this.id);
}

class GameExampleCompanion extends UpdateCompanion<GameExampleData> {
  final Value<int> levelid;
  final Value<String> uuid;
  final Value<String> arithmetric;
  final Value<String> boxcount;
  final Value<String> answer;
  final Value<String> name;
  final Value<String> image;
  final Value<int> id;
  const GameExampleCompanion({
    this.levelid = const Value.absent(),
    this.uuid = const Value.absent(),
    this.arithmetric = const Value.absent(),
    this.boxcount = const Value.absent(),
    this.answer = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.id = const Value.absent(),
  });
  GameExampleCompanion.insert({
    @required int levelid,
    @required String uuid,
    @required String arithmetric,
    @required String boxcount,
    @required String answer,
    @required String name,
    @required String image,
    this.id = const Value.absent(),
  })  : levelid = Value(levelid),
        uuid = Value(uuid),
        arithmetric = Value(arithmetric),
        boxcount = Value(boxcount),
        answer = Value(answer),
        name = Value(name),
        image = Value(image);
  static Insertable<GameExampleData> custom({
    Expression<int> levelid,
    Expression<String> uuid,
    Expression<String> arithmetric,
    Expression<String> boxcount,
    Expression<String> answer,
    Expression<String> name,
    Expression<String> image,
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (levelid != null) 'levelid': levelid,
      if (uuid != null) 'uuid': uuid,
      if (arithmetric != null) 'arithmetric': arithmetric,
      if (boxcount != null) 'boxcount': boxcount,
      if (answer != null) 'answer': answer,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (id != null) 'exampleid': id,
    });
  }

  GameExampleCompanion copyWith(
      {Value<int> levelid,
      Value<String> uuid,
      Value<String> arithmetric,
      Value<String> boxcount,
      Value<String> answer,
      Value<String> name,
      Value<String> image,
      Value<int> id}) {
    return GameExampleCompanion(
      levelid: levelid ?? this.levelid,
      uuid: uuid ?? this.uuid,
      arithmetric: arithmetric ?? this.arithmetric,
      boxcount: boxcount ?? this.boxcount,
      answer: answer ?? this.answer,
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (levelid.present) {
      map['levelid'] = Variable<int>(levelid.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (arithmetric.present) {
      map['arithmetric'] = Variable<String>(arithmetric.value);
    }
    if (boxcount.present) {
      map['boxcount'] = Variable<String>(boxcount.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (id.present) {
      map['exampleid'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameExampleCompanion(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $GameExampleTable extends GameExample
    with TableInfo<$GameExampleTable, GameExampleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameExampleTable(this._db, [this._alias]);
  final VerificationMeta _levelidMeta = const VerificationMeta('levelid');
  GeneratedIntColumn _levelid;
  @override
  GeneratedIntColumn get levelid => _levelid ??= _constructLevelid();
  GeneratedIntColumn _constructLevelid() {
    return GeneratedIntColumn('levelid', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES gamelevel (levelid)');
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _arithmetricMeta =
      const VerificationMeta('arithmetric');
  GeneratedTextColumn _arithmetric;
  @override
  GeneratedTextColumn get arithmetric =>
      _arithmetric ??= _constructArithmetric();
  GeneratedTextColumn _constructArithmetric() {
    return GeneratedTextColumn('arithmetric', $tableName, false,
        minTextLength: 1, maxTextLength: 2);
  }

  final VerificationMeta _boxcountMeta = const VerificationMeta('boxcount');
  GeneratedTextColumn _boxcount;
  @override
  GeneratedTextColumn get boxcount => _boxcount ??= _constructBoxcount();
  GeneratedTextColumn _constructBoxcount() {
    return GeneratedTextColumn(
      'boxcount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  GeneratedTextColumn _answer;
  @override
  GeneratedTextColumn get answer => _answer ??= _constructAnswer();
  GeneratedTextColumn _constructAnswer() {
    return GeneratedTextColumn(
      'answer',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('exampleid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [levelid, uuid, arithmetric, boxcount, answer, name, image, id];
  @override
  $GameExampleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gameexample';
  @override
  final String actualTableName = 'gameexample';
  @override
  VerificationContext validateIntegrity(Insertable<GameExampleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('levelid')) {
      context.handle(_levelidMeta,
          levelid.isAcceptableOrUnknown(data['levelid'], _levelidMeta));
    } else if (isInserting) {
      context.missing(_levelidMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('arithmetric')) {
      context.handle(
          _arithmetricMeta,
          arithmetric.isAcceptableOrUnknown(
              data['arithmetric'], _arithmetricMeta));
    } else if (isInserting) {
      context.missing(_arithmetricMeta);
    }
    if (data.containsKey('boxcount')) {
      context.handle(_boxcountMeta,
          boxcount.isAcceptableOrUnknown(data['boxcount'], _boxcountMeta));
    } else if (isInserting) {
      context.missing(_boxcountMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer'], _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('exampleid')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['exampleid'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameExampleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameExampleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GameExampleTable createAlias(String alias) {
    return $GameExampleTable(_db, alias);
  }
}

class GameQuestionData extends DataClass
    implements Insertable<GameQuestionData> {
  final int levelid;
  final String uuid;
  final String arithmetric;
  final String boxcount;
  final String answer;
  final String name;
  final String image;
  final int id;
  GameQuestionData(
      {@required this.levelid,
      @required this.uuid,
      @required this.arithmetric,
      @required this.boxcount,
      @required this.answer,
      @required this.name,
      @required this.image,
      @required this.id});
  factory GameQuestionData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return GameQuestionData(
      levelid:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}levelid']),
      uuid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uuid']),
      arithmetric: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}arithmetric']),
      boxcount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}boxcount']),
      answer:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}answer']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}gamequestionid']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || levelid != null) {
      map['levelid'] = Variable<int>(levelid);
    }
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || arithmetric != null) {
      map['arithmetric'] = Variable<String>(arithmetric);
    }
    if (!nullToAbsent || boxcount != null) {
      map['boxcount'] = Variable<String>(boxcount);
    }
    if (!nullToAbsent || answer != null) {
      map['answer'] = Variable<String>(answer);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || id != null) {
      map['gamequestionid'] = Variable<int>(id);
    }
    return map;
  }

  GameQuestionCompanion toCompanion(bool nullToAbsent) {
    return GameQuestionCompanion(
      levelid: levelid == null && nullToAbsent
          ? const Value.absent()
          : Value(levelid),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      arithmetric: arithmetric == null && nullToAbsent
          ? const Value.absent()
          : Value(arithmetric),
      boxcount: boxcount == null && nullToAbsent
          ? const Value.absent()
          : Value(boxcount),
      answer:
          answer == null && nullToAbsent ? const Value.absent() : Value(answer),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory GameQuestionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GameQuestionData(
      levelid: serializer.fromJson<int>(json['levelid']),
      uuid: serializer.fromJson<String>(json['uuid']),
      arithmetric: serializer.fromJson<String>(json['arithmetric']),
      boxcount: serializer.fromJson<String>(json['boxcount']),
      answer: serializer.fromJson<String>(json['answer']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'levelid': serializer.toJson<int>(levelid),
      'uuid': serializer.toJson<String>(uuid),
      'arithmetric': serializer.toJson<String>(arithmetric),
      'boxcount': serializer.toJson<String>(boxcount),
      'answer': serializer.toJson<String>(answer),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'id': serializer.toJson<int>(id),
    };
  }

  GameQuestionData copyWith(
          {int levelid,
          String uuid,
          String arithmetric,
          String boxcount,
          String answer,
          String name,
          String image,
          int id}) =>
      GameQuestionData(
        levelid: levelid ?? this.levelid,
        uuid: uuid ?? this.uuid,
        arithmetric: arithmetric ?? this.arithmetric,
        boxcount: boxcount ?? this.boxcount,
        answer: answer ?? this.answer,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('GameQuestionData(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      levelid.hashCode,
      $mrjc(
          uuid.hashCode,
          $mrjc(
              arithmetric.hashCode,
              $mrjc(
                  boxcount.hashCode,
                  $mrjc(
                      answer.hashCode,
                      $mrjc(name.hashCode,
                          $mrjc(image.hashCode, id.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameQuestionData &&
          other.levelid == this.levelid &&
          other.uuid == this.uuid &&
          other.arithmetric == this.arithmetric &&
          other.boxcount == this.boxcount &&
          other.answer == this.answer &&
          other.name == this.name &&
          other.image == this.image &&
          other.id == this.id);
}

class GameQuestionCompanion extends UpdateCompanion<GameQuestionData> {
  final Value<int> levelid;
  final Value<String> uuid;
  final Value<String> arithmetric;
  final Value<String> boxcount;
  final Value<String> answer;
  final Value<String> name;
  final Value<String> image;
  final Value<int> id;
  const GameQuestionCompanion({
    this.levelid = const Value.absent(),
    this.uuid = const Value.absent(),
    this.arithmetric = const Value.absent(),
    this.boxcount = const Value.absent(),
    this.answer = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.id = const Value.absent(),
  });
  GameQuestionCompanion.insert({
    @required int levelid,
    @required String uuid,
    @required String arithmetric,
    @required String boxcount,
    @required String answer,
    @required String name,
    @required String image,
    this.id = const Value.absent(),
  })  : levelid = Value(levelid),
        uuid = Value(uuid),
        arithmetric = Value(arithmetric),
        boxcount = Value(boxcount),
        answer = Value(answer),
        name = Value(name),
        image = Value(image);
  static Insertable<GameQuestionData> custom({
    Expression<int> levelid,
    Expression<String> uuid,
    Expression<String> arithmetric,
    Expression<String> boxcount,
    Expression<String> answer,
    Expression<String> name,
    Expression<String> image,
    Expression<int> id,
  }) {
    return RawValuesInsertable({
      if (levelid != null) 'levelid': levelid,
      if (uuid != null) 'uuid': uuid,
      if (arithmetric != null) 'arithmetric': arithmetric,
      if (boxcount != null) 'boxcount': boxcount,
      if (answer != null) 'answer': answer,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (id != null) 'gamequestionid': id,
    });
  }

  GameQuestionCompanion copyWith(
      {Value<int> levelid,
      Value<String> uuid,
      Value<String> arithmetric,
      Value<String> boxcount,
      Value<String> answer,
      Value<String> name,
      Value<String> image,
      Value<int> id}) {
    return GameQuestionCompanion(
      levelid: levelid ?? this.levelid,
      uuid: uuid ?? this.uuid,
      arithmetric: arithmetric ?? this.arithmetric,
      boxcount: boxcount ?? this.boxcount,
      answer: answer ?? this.answer,
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (levelid.present) {
      map['levelid'] = Variable<int>(levelid.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (arithmetric.present) {
      map['arithmetric'] = Variable<String>(arithmetric.value);
    }
    if (boxcount.present) {
      map['boxcount'] = Variable<String>(boxcount.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (id.present) {
      map['gamequestionid'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameQuestionCompanion(')
          ..write('levelid: $levelid, ')
          ..write('uuid: $uuid, ')
          ..write('arithmetric: $arithmetric, ')
          ..write('boxcount: $boxcount, ')
          ..write('answer: $answer, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $GameQuestionTable extends GameQuestion
    with TableInfo<$GameQuestionTable, GameQuestionData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameQuestionTable(this._db, [this._alias]);
  final VerificationMeta _levelidMeta = const VerificationMeta('levelid');
  GeneratedIntColumn _levelid;
  @override
  GeneratedIntColumn get levelid => _levelid ??= _constructLevelid();
  GeneratedIntColumn _constructLevelid() {
    return GeneratedIntColumn('levelid', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES gamelevel (levelid)');
  }

  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  GeneratedTextColumn _uuid;
  @override
  GeneratedTextColumn get uuid => _uuid ??= _constructUuid();
  GeneratedTextColumn _constructUuid() {
    return GeneratedTextColumn('uuid', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _arithmetricMeta =
      const VerificationMeta('arithmetric');
  GeneratedTextColumn _arithmetric;
  @override
  GeneratedTextColumn get arithmetric =>
      _arithmetric ??= _constructArithmetric();
  GeneratedTextColumn _constructArithmetric() {
    return GeneratedTextColumn('arithmetric', $tableName, false,
        minTextLength: 1, maxTextLength: 2);
  }

  final VerificationMeta _boxcountMeta = const VerificationMeta('boxcount');
  GeneratedTextColumn _boxcount;
  @override
  GeneratedTextColumn get boxcount => _boxcount ??= _constructBoxcount();
  GeneratedTextColumn _constructBoxcount() {
    return GeneratedTextColumn(
      'boxcount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  GeneratedTextColumn _answer;
  @override
  GeneratedTextColumn get answer => _answer ??= _constructAnswer();
  GeneratedTextColumn _constructAnswer() {
    return GeneratedTextColumn(
      'answer',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('gamequestionid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [levelid, uuid, arithmetric, boxcount, answer, name, image, id];
  @override
  $GameQuestionTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gamequestion';
  @override
  final String actualTableName = 'gamequestion';
  @override
  VerificationContext validateIntegrity(Insertable<GameQuestionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('levelid')) {
      context.handle(_levelidMeta,
          levelid.isAcceptableOrUnknown(data['levelid'], _levelidMeta));
    } else if (isInserting) {
      context.missing(_levelidMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid'], _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('arithmetric')) {
      context.handle(
          _arithmetricMeta,
          arithmetric.isAcceptableOrUnknown(
              data['arithmetric'], _arithmetricMeta));
    } else if (isInserting) {
      context.missing(_arithmetricMeta);
    }
    if (data.containsKey('boxcount')) {
      context.handle(_boxcountMeta,
          boxcount.isAcceptableOrUnknown(data['boxcount'], _boxcountMeta));
    } else if (isInserting) {
      context.missing(_boxcountMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer'], _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('gamequestionid')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['gamequestionid'], _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameQuestionData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameQuestionData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GameQuestionTable createAlias(String alias) {
    return $GameQuestionTable(_db, alias);
  }
}

class GameLevelData extends DataClass implements Insertable<GameLevelData> {
  final int id;
  final bool completed;
  final int totalscore;
  final int currentscore;
  final bool downloaded;
  GameLevelData(
      {@required this.id,
      @required this.completed,
      @required this.totalscore,
      @required this.currentscore,
      @required this.downloaded});
  factory GameLevelData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return GameLevelData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}levelid']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      totalscore:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}totalscore']),
      currentscore: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}currentscore']),
      downloaded: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}downloaded']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['levelid'] = Variable<int>(id);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    if (!nullToAbsent || totalscore != null) {
      map['totalscore'] = Variable<int>(totalscore);
    }
    if (!nullToAbsent || currentscore != null) {
      map['currentscore'] = Variable<int>(currentscore);
    }
    if (!nullToAbsent || downloaded != null) {
      map['downloaded'] = Variable<bool>(downloaded);
    }
    return map;
  }

  GameLevelCompanion toCompanion(bool nullToAbsent) {
    return GameLevelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      totalscore: totalscore == null && nullToAbsent
          ? const Value.absent()
          : Value(totalscore),
      currentscore: currentscore == null && nullToAbsent
          ? const Value.absent()
          : Value(currentscore),
      downloaded: downloaded == null && nullToAbsent
          ? const Value.absent()
          : Value(downloaded),
    );
  }

  factory GameLevelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GameLevelData(
      id: serializer.fromJson<int>(json['id']),
      completed: serializer.fromJson<bool>(json['completed']),
      totalscore: serializer.fromJson<int>(json['totalscore']),
      currentscore: serializer.fromJson<int>(json['currentscore']),
      downloaded: serializer.fromJson<bool>(json['downloaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completed': serializer.toJson<bool>(completed),
      'totalscore': serializer.toJson<int>(totalscore),
      'currentscore': serializer.toJson<int>(currentscore),
      'downloaded': serializer.toJson<bool>(downloaded),
    };
  }

  GameLevelData copyWith(
          {int id,
          bool completed,
          int totalscore,
          int currentscore,
          bool downloaded}) =>
      GameLevelData(
        id: id ?? this.id,
        completed: completed ?? this.completed,
        totalscore: totalscore ?? this.totalscore,
        currentscore: currentscore ?? this.currentscore,
        downloaded: downloaded ?? this.downloaded,
      );
  @override
  String toString() {
    return (StringBuffer('GameLevelData(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('totalscore: $totalscore, ')
          ..write('currentscore: $currentscore, ')
          ..write('downloaded: $downloaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          completed.hashCode,
          $mrjc(totalscore.hashCode,
              $mrjc(currentscore.hashCode, downloaded.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GameLevelData &&
          other.id == this.id &&
          other.completed == this.completed &&
          other.totalscore == this.totalscore &&
          other.currentscore == this.currentscore &&
          other.downloaded == this.downloaded);
}

class GameLevelCompanion extends UpdateCompanion<GameLevelData> {
  final Value<int> id;
  final Value<bool> completed;
  final Value<int> totalscore;
  final Value<int> currentscore;
  final Value<bool> downloaded;
  const GameLevelCompanion({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.totalscore = const Value.absent(),
    this.currentscore = const Value.absent(),
    this.downloaded = const Value.absent(),
  });
  GameLevelCompanion.insert({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    @required int totalscore,
    @required int currentscore,
    this.downloaded = const Value.absent(),
  })  : totalscore = Value(totalscore),
        currentscore = Value(currentscore);
  static Insertable<GameLevelData> custom({
    Expression<int> id,
    Expression<bool> completed,
    Expression<int> totalscore,
    Expression<int> currentscore,
    Expression<bool> downloaded,
  }) {
    return RawValuesInsertable({
      if (id != null) 'levelid': id,
      if (completed != null) 'completed': completed,
      if (totalscore != null) 'totalscore': totalscore,
      if (currentscore != null) 'currentscore': currentscore,
      if (downloaded != null) 'downloaded': downloaded,
    });
  }

  GameLevelCompanion copyWith(
      {Value<int> id,
      Value<bool> completed,
      Value<int> totalscore,
      Value<int> currentscore,
      Value<bool> downloaded}) {
    return GameLevelCompanion(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      totalscore: totalscore ?? this.totalscore,
      currentscore: currentscore ?? this.currentscore,
      downloaded: downloaded ?? this.downloaded,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['levelid'] = Variable<int>(id.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (totalscore.present) {
      map['totalscore'] = Variable<int>(totalscore.value);
    }
    if (currentscore.present) {
      map['currentscore'] = Variable<int>(currentscore.value);
    }
    if (downloaded.present) {
      map['downloaded'] = Variable<bool>(downloaded.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameLevelCompanion(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('totalscore: $totalscore, ')
          ..write('currentscore: $currentscore, ')
          ..write('downloaded: $downloaded')
          ..write(')'))
        .toString();
  }
}

class $GameLevelTable extends GameLevel
    with TableInfo<$GameLevelTable, GameLevelData> {
  final GeneratedDatabase _db;
  final String _alias;
  $GameLevelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('levelid', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _totalscoreMeta = const VerificationMeta('totalscore');
  GeneratedIntColumn _totalscore;
  @override
  GeneratedIntColumn get totalscore => _totalscore ??= _constructTotalscore();
  GeneratedIntColumn _constructTotalscore() {
    return GeneratedIntColumn(
      'totalscore',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currentscoreMeta =
      const VerificationMeta('currentscore');
  GeneratedIntColumn _currentscore;
  @override
  GeneratedIntColumn get currentscore =>
      _currentscore ??= _constructCurrentscore();
  GeneratedIntColumn _constructCurrentscore() {
    return GeneratedIntColumn(
      'currentscore',
      $tableName,
      false,
    );
  }

  final VerificationMeta _downloadedMeta = const VerificationMeta('downloaded');
  GeneratedBoolColumn _downloaded;
  @override
  GeneratedBoolColumn get downloaded => _downloaded ??= _constructDownloaded();
  GeneratedBoolColumn _constructDownloaded() {
    return GeneratedBoolColumn('downloaded', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, completed, totalscore, currentscore, downloaded];
  @override
  $GameLevelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'gamelevel';
  @override
  final String actualTableName = 'gamelevel';
  @override
  VerificationContext validateIntegrity(Insertable<GameLevelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('levelid')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['levelid'], _idMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    if (data.containsKey('totalscore')) {
      context.handle(
          _totalscoreMeta,
          totalscore.isAcceptableOrUnknown(
              data['totalscore'], _totalscoreMeta));
    } else if (isInserting) {
      context.missing(_totalscoreMeta);
    }
    if (data.containsKey('currentscore')) {
      context.handle(
          _currentscoreMeta,
          currentscore.isAcceptableOrUnknown(
              data['currentscore'], _currentscoreMeta));
    } else if (isInserting) {
      context.missing(_currentscoreMeta);
    }
    if (data.containsKey('downloaded')) {
      context.handle(
          _downloadedMeta,
          downloaded.isAcceptableOrUnknown(
              data['downloaded'], _downloadedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameLevelData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GameLevelData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GameLevelTable createAlias(String alias) {
    return $GameLevelTable(_db, alias);
  }
}

abstract class _$KidsGameDatabase extends GeneratedDatabase {
  _$KidsGameDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GameBookTable _gameBook;
  $GameBookTable get gameBook => _gameBook ??= $GameBookTable(this);
  $GameIntroductionTable _gameIntroduction;
  $GameIntroductionTable get gameIntroduction =>
      _gameIntroduction ??= $GameIntroductionTable(this);
  $GameExampleTable _gameExample;
  $GameExampleTable get gameExample => _gameExample ??= $GameExampleTable(this);
  $GameQuestionTable _gameQuestion;
  $GameQuestionTable get gameQuestion =>
      _gameQuestion ??= $GameQuestionTable(this);
  $GameLevelTable _gameLevel;
  $GameLevelTable get gameLevel => _gameLevel ??= $GameLevelTable(this);
  GameBookDao _gameBookDao;
  GameBookDao get gameBookDao =>
      _gameBookDao ??= GameBookDao(this as KidsGameDatabase);
  GameLevelDao _gameLevelDao;
  GameLevelDao get gameLevelDao =>
      _gameLevelDao ??= GameLevelDao(this as KidsGameDatabase);
  GameIntroductionDao _gameIntroductionDao;
  GameIntroductionDao get gameIntroductionDao =>
      _gameIntroductionDao ??= GameIntroductionDao(this as KidsGameDatabase);
  GameExampleDao _gameExampleDao;
  GameExampleDao get gameExampleDao =>
      _gameExampleDao ??= GameExampleDao(this as KidsGameDatabase);
  GameQuestionDao _gameQuestionDao;
  GameQuestionDao get gameQuestionDao =>
      _gameQuestionDao ??= GameQuestionDao(this as KidsGameDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameBook, gameIntroduction, gameExample, gameQuestion, gameLevel];
}
