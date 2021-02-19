import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/tables/tables.dart';

import '../kid_games_database.dart';

part 'level_dao.g.dart';

class LevelExamples {
  final GameLevel gameLevel;
  final GameExample gameExample;

  LevelExamples({this.gameLevel, this.gameExample});
}

@UseDao(tables: [GameBook, GameLevel])
class GameLevelDao extends DatabaseAccessor<KidsGameDatabase> with _$GameLevelDaoMixin {
  final KidsGameDatabase db;
  GameLevelDao(this.db) : super(db);

  Stream<List<GameLevelData>> getlevelexample() {
    return (select(gameLevel).watch());
  }

  Future<void> updategamescore({int id, int score}) async {
    await (update(gameLevel)..where((level) => level.id.equals(id)))
        .write(GameLevelCompanion(currentscore: Value(score)));
  }

  Future<void> updatedownloadstate({int id, bool downloaded}) async {
    await (update(gameLevel)..where((level) => level.id.equals(id)))
        .write(GameLevelCompanion(downloaded: Value(downloaded)));
  }
}
