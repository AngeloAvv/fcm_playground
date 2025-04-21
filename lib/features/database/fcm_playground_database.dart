import 'package:drift/drift.dart';
import 'package:fcm_playground/features/database/dao/project/project_dao.dart';
import 'package:fcm_playground/features/database/fcm_playground_database.drift.dart';
import 'package:fcm_playground/features/database/tables/projects/projects_table.dart';

@DriftDatabase(tables: [ProjectsTable], daos: [ProjectDAO])
class FcmPlaygroundDatabase extends $FcmPlaygroundDatabase {
  final bool foreignKeysEnabled;

  FcmPlaygroundDatabase(super.executor, {this.foreignKeysEnabled = true});

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      if (foreignKeysEnabled) {
        await customStatement('PRAGMA foreign_keys = ON;');
      }
    },
    onCreate: (migrator) async {
      await migrator.createAll();
    },
  );
}
