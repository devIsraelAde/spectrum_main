import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/tables/tables.dart';

import '../../../database.dart';

part 'introduction_dao.g.dart';

@UseDao(tables: [GameLevel, GameIntroduction])
class GameIntroductionDao extends DatabaseAccessor<KidsGameDatabase> with _$GameIntroductionDaoMixin {
  final KidsGameDatabase db;
  GameIntroductionDao(this.db) : super(db);

  Stream<List<GameIntroductionData>> getexamples({int level}) {
    return (select(gameIntroduction)..where((introduction) => introduction.levelid.equals(level))).watch();
  }
}
