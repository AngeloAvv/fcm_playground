import 'package:drift/drift.dart';
import 'package:fcm_playground/features/database/dao/project/project_dao.drift.dart';
import 'package:fcm_playground/features/database/fcm_playground_database.dart';
import 'package:fcm_playground/features/database/tables/projects/projects_table.dart';
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart';

@DriftAccessor(tables: [ProjectsTable])
class ProjectDAO extends DatabaseAccessor<FcmPlaygroundDatabase>
    with $ProjectDAOMixin {
  ProjectDAO(super.attachedDatabase);

  Future<void> edit(int id, ProjectsTableCompanion projects) =>
      (update(projectsTable)
        ..where((tbl) => tbl.id.equals(id))).write(projects);

  Future<void> save(ProjectsTableCompanion projects) =>
      into(projectsTable).insert(projects, mode: InsertMode.insertOrReplace);

  Future<List<ProjectsEntity>> fetch() => (select(projectsTable)).get();

  Stream<List<ProjectsEntity>> realtimeFetch() =>
      (select(projectsTable)).watch();

  Future<ProjectsEntity?> get(int id) =>
      (select(projectsTable)
        ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Stream<ProjectsEntity?> realtimeGet(int id) =>
      (select(projectsTable)
        ..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();

  Future<void> remove(int id) =>
      (delete(projectsTable)..where((tbl) => tbl.id.equals(id))).go();
}
