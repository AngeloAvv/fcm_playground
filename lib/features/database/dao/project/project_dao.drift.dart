// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:fcm_playground/features/database/fcm_playground_database.dart'
    as i1;
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart'
    as i2;
import 'package:drift/internal/modular.dart' as i3;

mixin $ProjectDAOMixin on i0.DatabaseAccessor<i1.FcmPlaygroundDatabase> {
  i2.$ProjectsTableTable get projectsTable =>
      i3.ReadDatabaseContainer(attachedDatabase)
          .resultSet<i2.$ProjectsTableTable>('projects');
  ProjectDAOManager get managers => ProjectDAOManager(this);
}

class ProjectDAOManager {
  final $ProjectDAOMixin _db;
  ProjectDAOManager(this._db);
  i2.$$ProjectsTableTableTableManager get projectsTable =>
      i2.$$ProjectsTableTableTableManager(
        _db.attachedDatabase,
        _db.projectsTable,
      );
}
