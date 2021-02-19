// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'api_services.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ApiResourcesMethodTearOff {
  const _$ApiResourcesMethodTearOff();

// ignore: unused_element
  GameResource games({Game games}) {
    return GameResource(
      games: games,
    );
  }

// ignore: unused_element
  BookResource books({Books books}) {
    return BookResource(
      books: books,
    );
  }

// ignore: unused_element
  SpecialBookResource specialbooks({SpecialBooks specialBooks}) {
    return SpecialBookResource(
      specialBooks: specialBooks,
    );
  }

// ignore: unused_element
  PuzzleResource puzzles({PuzzleData puzzleData}) {
    return PuzzleResource(
      puzzleData: puzzleData,
    );
  }

// ignore: unused_element
  NoneResource none({String message}) {
    return NoneResource(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ApiResourcesMethod = _$ApiResourcesMethodTearOff();

/// @nodoc
mixin _$ApiResourcesMethod {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ApiResourcesMethodCopyWith<$Res> {
  factory $ApiResourcesMethodCopyWith(
          ApiResourcesMethod value, $Res Function(ApiResourcesMethod) then) =
      _$ApiResourcesMethodCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $ApiResourcesMethodCopyWith<$Res> {
  _$ApiResourcesMethodCopyWithImpl(this._value, this._then);

  final ApiResourcesMethod _value;
  // ignore: unused_field
  final $Res Function(ApiResourcesMethod) _then;
}

/// @nodoc
abstract class $GameResourceCopyWith<$Res> {
  factory $GameResourceCopyWith(
          GameResource value, $Res Function(GameResource) then) =
      _$GameResourceCopyWithImpl<$Res>;
  $Res call({Game games});
}

/// @nodoc
class _$GameResourceCopyWithImpl<$Res>
    extends _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $GameResourceCopyWith<$Res> {
  _$GameResourceCopyWithImpl(
      GameResource _value, $Res Function(GameResource) _then)
      : super(_value, (v) => _then(v as GameResource));

  @override
  GameResource get _value => super._value as GameResource;

  @override
  $Res call({
    Object games = freezed,
  }) {
    return _then(GameResource(
      games: games == freezed ? _value.games : games as Game,
    ));
  }
}

/// @nodoc
class _$GameResource implements GameResource {
  const _$GameResource({this.games});

  @override
  final Game games;

  @override
  String toString() {
    return 'ApiResourcesMethod.games(games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GameResource &&
            (identical(other.games, games) ||
                const DeepCollectionEquality().equals(other.games, games)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(games);

  @override
  $GameResourceCopyWith<GameResource> get copyWith =>
      _$GameResourceCopyWithImpl<GameResource>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return games(this.games);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (games != null) {
      return games(this.games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return games(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (games != null) {
      return games(this);
    }
    return orElse();
  }
}

abstract class GameResource implements ApiResourcesMethod {
  const factory GameResource({Game games}) = _$GameResource;

  Game get games;
  $GameResourceCopyWith<GameResource> get copyWith;
}

/// @nodoc
abstract class $BookResourceCopyWith<$Res> {
  factory $BookResourceCopyWith(
          BookResource value, $Res Function(BookResource) then) =
      _$BookResourceCopyWithImpl<$Res>;
  $Res call({Books books});
}

/// @nodoc
class _$BookResourceCopyWithImpl<$Res>
    extends _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $BookResourceCopyWith<$Res> {
  _$BookResourceCopyWithImpl(
      BookResource _value, $Res Function(BookResource) _then)
      : super(_value, (v) => _then(v as BookResource));

  @override
  BookResource get _value => super._value as BookResource;

  @override
  $Res call({
    Object books = freezed,
  }) {
    return _then(BookResource(
      books: books == freezed ? _value.books : books as Books,
    ));
  }
}

/// @nodoc
class _$BookResource implements BookResource {
  const _$BookResource({this.books});

  @override
  final Books books;

  @override
  String toString() {
    return 'ApiResourcesMethod.books(books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookResource &&
            (identical(other.books, books) ||
                const DeepCollectionEquality().equals(other.books, books)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(books);

  @override
  $BookResourceCopyWith<BookResource> get copyWith =>
      _$BookResourceCopyWithImpl<BookResource>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return books(this.books);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (books != null) {
      return books(this.books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return books(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (books != null) {
      return books(this);
    }
    return orElse();
  }
}

abstract class BookResource implements ApiResourcesMethod {
  const factory BookResource({Books books}) = _$BookResource;

  Books get books;
  $BookResourceCopyWith<BookResource> get copyWith;
}

/// @nodoc
abstract class $SpecialBookResourceCopyWith<$Res> {
  factory $SpecialBookResourceCopyWith(
          SpecialBookResource value, $Res Function(SpecialBookResource) then) =
      _$SpecialBookResourceCopyWithImpl<$Res>;
  $Res call({SpecialBooks specialBooks});
}

/// @nodoc
class _$SpecialBookResourceCopyWithImpl<$Res>
    extends _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $SpecialBookResourceCopyWith<$Res> {
  _$SpecialBookResourceCopyWithImpl(
      SpecialBookResource _value, $Res Function(SpecialBookResource) _then)
      : super(_value, (v) => _then(v as SpecialBookResource));

  @override
  SpecialBookResource get _value => super._value as SpecialBookResource;

  @override
  $Res call({
    Object specialBooks = freezed,
  }) {
    return _then(SpecialBookResource(
      specialBooks: specialBooks == freezed
          ? _value.specialBooks
          : specialBooks as SpecialBooks,
    ));
  }
}

/// @nodoc
class _$SpecialBookResource implements SpecialBookResource {
  const _$SpecialBookResource({this.specialBooks});

  @override
  final SpecialBooks specialBooks;

  @override
  String toString() {
    return 'ApiResourcesMethod.specialbooks(specialBooks: $specialBooks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpecialBookResource &&
            (identical(other.specialBooks, specialBooks) ||
                const DeepCollectionEquality()
                    .equals(other.specialBooks, specialBooks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(specialBooks);

  @override
  $SpecialBookResourceCopyWith<SpecialBookResource> get copyWith =>
      _$SpecialBookResourceCopyWithImpl<SpecialBookResource>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return specialbooks(specialBooks);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (specialbooks != null) {
      return specialbooks(specialBooks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return specialbooks(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (specialbooks != null) {
      return specialbooks(this);
    }
    return orElse();
  }
}

abstract class SpecialBookResource implements ApiResourcesMethod {
  const factory SpecialBookResource({SpecialBooks specialBooks}) =
      _$SpecialBookResource;

  SpecialBooks get specialBooks;
  $SpecialBookResourceCopyWith<SpecialBookResource> get copyWith;
}

/// @nodoc
abstract class $PuzzleResourceCopyWith<$Res> {
  factory $PuzzleResourceCopyWith(
          PuzzleResource value, $Res Function(PuzzleResource) then) =
      _$PuzzleResourceCopyWithImpl<$Res>;
  $Res call({PuzzleData puzzleData});
}

/// @nodoc
class _$PuzzleResourceCopyWithImpl<$Res>
    extends _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $PuzzleResourceCopyWith<$Res> {
  _$PuzzleResourceCopyWithImpl(
      PuzzleResource _value, $Res Function(PuzzleResource) _then)
      : super(_value, (v) => _then(v as PuzzleResource));

  @override
  PuzzleResource get _value => super._value as PuzzleResource;

  @override
  $Res call({
    Object puzzleData = freezed,
  }) {
    return _then(PuzzleResource(
      puzzleData:
          puzzleData == freezed ? _value.puzzleData : puzzleData as PuzzleData,
    ));
  }
}

/// @nodoc
class _$PuzzleResource implements PuzzleResource {
  const _$PuzzleResource({this.puzzleData});

  @override
  final PuzzleData puzzleData;

  @override
  String toString() {
    return 'ApiResourcesMethod.puzzles(puzzleData: $puzzleData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PuzzleResource &&
            (identical(other.puzzleData, puzzleData) ||
                const DeepCollectionEquality()
                    .equals(other.puzzleData, puzzleData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(puzzleData);

  @override
  $PuzzleResourceCopyWith<PuzzleResource> get copyWith =>
      _$PuzzleResourceCopyWithImpl<PuzzleResource>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return puzzles(puzzleData);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (puzzles != null) {
      return puzzles(puzzleData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return puzzles(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (puzzles != null) {
      return puzzles(this);
    }
    return orElse();
  }
}

abstract class PuzzleResource implements ApiResourcesMethod {
  const factory PuzzleResource({PuzzleData puzzleData}) = _$PuzzleResource;

  PuzzleData get puzzleData;
  $PuzzleResourceCopyWith<PuzzleResource> get copyWith;
}

/// @nodoc
abstract class $NoneResourceCopyWith<$Res> {
  factory $NoneResourceCopyWith(
          NoneResource value, $Res Function(NoneResource) then) =
      _$NoneResourceCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$NoneResourceCopyWithImpl<$Res>
    extends _$ApiResourcesMethodCopyWithImpl<$Res>
    implements $NoneResourceCopyWith<$Res> {
  _$NoneResourceCopyWithImpl(
      NoneResource _value, $Res Function(NoneResource) _then)
      : super(_value, (v) => _then(v as NoneResource));

  @override
  NoneResource get _value => super._value as NoneResource;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(NoneResource(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$NoneResource implements NoneResource {
  const _$NoneResource({this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ApiResourcesMethod.none(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NoneResource &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $NoneResourceCopyWith<NoneResource> get copyWith =>
      _$NoneResourceCopyWithImpl<NoneResource>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result games(Game games),
    @required Result books(Books books),
    @required Result specialbooks(SpecialBooks specialBooks),
    @required Result puzzles(PuzzleData puzzleData),
    @required Result none(String message),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return none(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result games(Game games),
    Result books(Books books),
    Result specialbooks(SpecialBooks specialBooks),
    Result puzzles(PuzzleData puzzleData),
    Result none(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result games(GameResource value),
    @required Result books(BookResource value),
    @required Result specialbooks(SpecialBookResource value),
    @required Result puzzles(PuzzleResource value),
    @required Result none(NoneResource value),
  }) {
    assert(games != null);
    assert(books != null);
    assert(specialbooks != null);
    assert(puzzles != null);
    assert(none != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result games(GameResource value),
    Result books(BookResource value),
    Result specialbooks(SpecialBookResource value),
    Result puzzles(PuzzleResource value),
    Result none(NoneResource value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class NoneResource implements ApiResourcesMethod {
  const factory NoneResource({String message}) = _$NoneResource;

  String get message;
  $NoneResourceCopyWith<NoneResource> get copyWith;
}
