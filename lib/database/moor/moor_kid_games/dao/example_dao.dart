import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/tables/tables.dart';

import '../kid_games_database.dart';

part 'example_dao.g.dart';

@UseDao(tables: [GameLevel, GameExample])
class GameExampleDao extends DatabaseAccessor<KidsGameDatabase> with _$GameExampleDaoMixin {
  final KidsGameDatabase db;

  GameExampleDao(this.db) : super(db);

  Stream<List<GameExampleData>> getexamples({int level}) {
    return (select(gameExample)..where((example) => example.levelid.equals(level))).watch();
  }
}
