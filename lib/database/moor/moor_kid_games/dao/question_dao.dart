import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/tables/tables.dart';

import '../kid_games_database.dart';

part 'question_dao.g.dart';

@UseDao(tables: [GameLevel, GameQuestion])
class GameQuestionDao extends DatabaseAccessor<KidsGameDatabase> with _$GameQuestionDaoMixin {
  final KidsGameDatabase db;
  GameQuestionDao(this.db) : super(db);

  Stream<List<GameQuestionData>> getexamples({int level}) {
    return (select(gameQuestion)..where((question) => question.levelid.equals(level))).watch();
  }
}
