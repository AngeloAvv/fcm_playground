import 'package:drift/drift.dart';

@DataClassName('ProjectsEntity')
class ProjectsTable extends Table {
  Column<int> get id => integer().autoIncrement()();

  Column<String> get name => text().nullable()();

  Column<String> get projectId => text().named('project_id')();

  Column<String> get clientId => text().named('client_id')();

  Column<String> get privateKey => text().named('private_key')();

  Column<String> get clientEmail => text().named('client_email')();

  Column<DateTime> get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  Column<DateTime> get updatedAt => dateTime().named('updated_at').nullable()();

  @override
  String get tableName => 'projects';
}
