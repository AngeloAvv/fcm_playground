// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart'
    as i1;
import 'package:fcm_playground/features/database/dao/project/project_dao.dart'
    as i2;
import 'package:fcm_playground/features/database/fcm_playground_database.dart'
    as i3;

abstract class $FcmPlaygroundDatabase extends i0.GeneratedDatabase {
  $FcmPlaygroundDatabase(i0.QueryExecutor e) : super(e);
  $FcmPlaygroundDatabaseManager get managers =>
      $FcmPlaygroundDatabaseManager(this);
  late final i1.$ProjectsTableTable projectsTable = i1.$ProjectsTableTable(
    this,
  );
  late final i2.ProjectDAO projectDAO = i2.ProjectDAO(
    this as i3.FcmPlaygroundDatabase,
  );
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [projectsTable];
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}

class $FcmPlaygroundDatabaseManager {
  final $FcmPlaygroundDatabase _db;
  $FcmPlaygroundDatabaseManager(this._db);
  i1.$$ProjectsTableTableTableManager get projectsTable =>
      i1.$$ProjectsTableTableTableManager(_db, _db.projectsTable);
}
