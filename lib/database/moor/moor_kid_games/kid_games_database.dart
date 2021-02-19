import 'package:moor_flutter/moor_flutter.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/dao/dao.dart';
import '../moor_kid_games/tables/tables.dart';

part 'kid_games_database.g.dart';

@UseMoor(
    tables: [GameBook, GameIntroduction, GameExample, GameQuestion, GameLevel],
    daos: [GameBookDao, GameLevelDao, GameIntroductionDao, GameExampleDao, GameQuestionDao])
class KidsGameDatabase extends _$KidsGameDatabase {
  KidsGameDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'kidgamesdb.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
