import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/tables/tables.dart';
import 'package:spectrum_library/model/model.dart';

import '../kid_games_database.dart';

part 'game_book_dao.g.dart';

@UseDao(tables: [
  GameBook,
])
class GameBookDao extends DatabaseAccessor<KidsGameDatabase> with _$GameBookDaoMixin {
  final KidsGameDatabase db;
  GameBookDao(this.db) : super(db);

  Stream<List<GameBookData>> watchAllBookGames() {
    return (select(gameBook)).watch();
  }

  getBookGamesRelatedToSubject({String uuid}) {
    return (select(gameBook)..where((bookgamesubject) => bookgamesubject.uuid.equals(uuid))).watch();
  }

  void addBookGames({SpecialBooks specialBooks}) {
    specialBooks.data.forEach((books) async => await into(gameBook).insert(GameBookCompanion.insert(
        uuid: books.uuid,
        booktitle: books.title,
        subject: books.subject,
        cover: books.front_cover,
        level: books.level_count)));
  }
}
