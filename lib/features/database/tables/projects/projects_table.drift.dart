// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:fcm_playground/features/database/tables/projects/projects_table.drift.dart'
    as i1;
import 'package:fcm_playground/features/database/tables/projects/projects_table.dart'
    as i2;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i3;

typedef $$ProjectsTableTableCreateCompanionBuilder =
    i1.ProjectsTableCompanion Function({
      i0.Value<int> id,
      i0.Value<String?> name,
      required String projectId,
      required String clientId,
      required String privateKey,
      required String clientEmail,
      i0.Value<DateTime> createdAt,
      i0.Value<DateTime?> updatedAt,
    });
typedef $$ProjectsTableTableUpdateCompanionBuilder =
    i1.ProjectsTableCompanion Function({
      i0.Value<int> id,
      i0.Value<String?> name,
      i0.Value<String> projectId,
      i0.Value<String> clientId,
      i0.Value<String> privateKey,
      i0.Value<String> clientEmail,
      i0.Value<DateTime> createdAt,
      i0.Value<DateTime?> updatedAt,
    });

class $$ProjectsTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ProjectsTableTable> {
  $$ProjectsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get privateKey => $composableBuilder(
    column: $table.privateKey,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$ProjectsTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ProjectsTableTable> {
  $$ProjectsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get privateKey => $composableBuilder(
    column: $table.privateKey,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$ProjectsTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ProjectsTableTable> {
  $$ProjectsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i0.GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  i0.GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  i0.GeneratedColumn<String> get privateKey => $composableBuilder(
    column: $table.privateKey,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => column,
  );

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProjectsTableTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.$ProjectsTableTable,
          i1.ProjectsEntity,
          i1.$$ProjectsTableTableFilterComposer,
          i1.$$ProjectsTableTableOrderingComposer,
          i1.$$ProjectsTableTableAnnotationComposer,
          $$ProjectsTableTableCreateCompanionBuilder,
          $$ProjectsTableTableUpdateCompanionBuilder,
          (
            i1.ProjectsEntity,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.$ProjectsTableTable,
              i1.ProjectsEntity
            >,
          ),
          i1.ProjectsEntity,
          i0.PrefetchHooks Function()
        > {
  $$ProjectsTableTableTableManager(
    i0.GeneratedDatabase db,
    i1.$ProjectsTableTable table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  i1.$$ProjectsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => i1.$$ProjectsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => i1.$$ProjectsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String?> name = const i0.Value.absent(),
                i0.Value<String> projectId = const i0.Value.absent(),
                i0.Value<String> clientId = const i0.Value.absent(),
                i0.Value<String> privateKey = const i0.Value.absent(),
                i0.Value<String> clientEmail = const i0.Value.absent(),
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<DateTime?> updatedAt = const i0.Value.absent(),
              }) => i1.ProjectsTableCompanion(
                id: id,
                name: name,
                projectId: projectId,
                clientId: clientId,
                privateKey: privateKey,
                clientEmail: clientEmail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String?> name = const i0.Value.absent(),
                required String projectId,
                required String clientId,
                required String privateKey,
                required String clientEmail,
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<DateTime?> updatedAt = const i0.Value.absent(),
              }) => i1.ProjectsTableCompanion.insert(
                id: id,
                name: name,
                projectId: projectId,
                clientId: clientId,
                privateKey: privateKey,
                clientEmail: clientEmail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          i0.BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectsTableTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.$ProjectsTableTable,
      i1.ProjectsEntity,
      i1.$$ProjectsTableTableFilterComposer,
      i1.$$ProjectsTableTableOrderingComposer,
      i1.$$ProjectsTableTableAnnotationComposer,
      $$ProjectsTableTableCreateCompanionBuilder,
      $$ProjectsTableTableUpdateCompanionBuilder,
      (
        i1.ProjectsEntity,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.$ProjectsTableTable,
          i1.ProjectsEntity
        >,
      ),
      i1.ProjectsEntity,
      i0.PrefetchHooks Function()
    >;

class $ProjectsTableTable extends i2.ProjectsTable
    with i0.TableInfo<$ProjectsTableTable, i1.ProjectsEntity> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: i0.DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const i0.VerificationMeta _nameMeta = const i0.VerificationMeta(
    'name',
  );
  @override
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const i0.VerificationMeta _projectIdMeta = const i0.VerificationMeta(
    'projectId',
  );
  @override
  late final i0.GeneratedColumn<String> projectId = i0.GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _clientIdMeta = const i0.VerificationMeta(
    'clientId',
  );
  @override
  late final i0.GeneratedColumn<String> clientId = i0.GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _privateKeyMeta = const i0.VerificationMeta(
    'privateKey',
  );
  @override
  late final i0.GeneratedColumn<String> privateKey = i0.GeneratedColumn<String>(
    'private_key',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _clientEmailMeta = const i0.VerificationMeta(
    'clientEmail',
  );
  @override
  late final i0.GeneratedColumn<String> clientEmail =
      i0.GeneratedColumn<String>(
        'client_email',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const i0.VerificationMeta _createdAtMeta = const i0.VerificationMeta(
    'createdAt',
  );
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>(
        'created_at',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: i3.currentDateAndTime,
      );
  static const i0.VerificationMeta _updatedAtMeta = const i0.VerificationMeta(
    'updatedAt',
  );
  @override
  late final i0.GeneratedColumn<DateTime> updatedAt =
      i0.GeneratedColumn<DateTime>(
        'updated_at',
        aliasedName,
        true,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<i0.GeneratedColumn> get $columns => [
    id,
    name,
    projectId,
    clientId,
    privateKey,
    clientEmail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ProjectsEntity> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('private_key')) {
      context.handle(
        _privateKeyMeta,
        privateKey.isAcceptableOrUnknown(data['private_key']!, _privateKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_privateKeyMeta);
    }
    if (data.containsKey('client_email')) {
      context.handle(
        _clientEmailMeta,
        clientEmail.isAcceptableOrUnknown(
          data['client_email']!,
          _clientEmailMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientEmailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.ProjectsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ProjectsEntity(
      id:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      projectId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}project_id'],
          )!,
      clientId:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}client_id'],
          )!,
      privateKey:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}private_key'],
          )!,
      clientEmail:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.string,
            data['${effectivePrefix}client_email'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            i0.DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ProjectsTableTable createAlias(String alias) {
    return $ProjectsTableTable(attachedDatabase, alias);
  }
}

class ProjectsEntity extends i0.DataClass
    implements i0.Insertable<i1.ProjectsEntity> {
  final int id;
  final String? name;
  final String projectId;
  final String clientId;
  final String privateKey;
  final String clientEmail;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const ProjectsEntity({
    required this.id,
    this.name,
    required this.projectId,
    required this.clientId,
    required this.privateKey,
    required this.clientEmail,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = i0.Variable<String>(name);
    }
    map['project_id'] = i0.Variable<String>(projectId);
    map['client_id'] = i0.Variable<String>(clientId);
    map['private_key'] = i0.Variable<String>(privateKey);
    map['client_email'] = i0.Variable<String>(clientEmail);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = i0.Variable<DateTime>(updatedAt);
    }
    return map;
  }

  i1.ProjectsTableCompanion toCompanion(bool nullToAbsent) {
    return i1.ProjectsTableCompanion(
      id: i0.Value(id),
      name:
          name == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(name),
      projectId: i0.Value(projectId),
      clientId: i0.Value(clientId),
      privateKey: i0.Value(privateKey),
      clientEmail: i0.Value(clientEmail),
      createdAt: i0.Value(createdAt),
      updatedAt:
          updatedAt == null && nullToAbsent
              ? const i0.Value.absent()
              : i0.Value(updatedAt),
    );
  }

  factory ProjectsEntity.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProjectsEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      projectId: serializer.fromJson<String>(json['projectId']),
      clientId: serializer.fromJson<String>(json['clientId']),
      privateKey: serializer.fromJson<String>(json['privateKey']),
      clientEmail: serializer.fromJson<String>(json['clientEmail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'projectId': serializer.toJson<String>(projectId),
      'clientId': serializer.toJson<String>(clientId),
      'privateKey': serializer.toJson<String>(privateKey),
      'clientEmail': serializer.toJson<String>(clientEmail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  i1.ProjectsEntity copyWith({
    int? id,
    i0.Value<String?> name = const i0.Value.absent(),
    String? projectId,
    String? clientId,
    String? privateKey,
    String? clientEmail,
    DateTime? createdAt,
    i0.Value<DateTime?> updatedAt = const i0.Value.absent(),
  }) => i1.ProjectsEntity(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    projectId: projectId ?? this.projectId,
    clientId: clientId ?? this.clientId,
    privateKey: privateKey ?? this.privateKey,
    clientEmail: clientEmail ?? this.clientEmail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ProjectsEntity copyWithCompanion(i1.ProjectsTableCompanion data) {
    return ProjectsEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      privateKey:
          data.privateKey.present ? data.privateKey.value : this.privateKey,
      clientEmail:
          data.clientEmail.present ? data.clientEmail.value : this.clientEmail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('projectId: $projectId, ')
          ..write('clientId: $clientId, ')
          ..write('privateKey: $privateKey, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    projectId,
    clientId,
    privateKey,
    clientEmail,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ProjectsEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.projectId == this.projectId &&
          other.clientId == this.clientId &&
          other.privateKey == this.privateKey &&
          other.clientEmail == this.clientEmail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsTableCompanion extends i0.UpdateCompanion<i1.ProjectsEntity> {
  final i0.Value<int> id;
  final i0.Value<String?> name;
  final i0.Value<String> projectId;
  final i0.Value<String> clientId;
  final i0.Value<String> privateKey;
  final i0.Value<String> clientEmail;
  final i0.Value<DateTime> createdAt;
  final i0.Value<DateTime?> updatedAt;
  const ProjectsTableCompanion({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.projectId = const i0.Value.absent(),
    this.clientId = const i0.Value.absent(),
    this.privateKey = const i0.Value.absent(),
    this.clientEmail = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.updatedAt = const i0.Value.absent(),
  });
  ProjectsTableCompanion.insert({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    required String projectId,
    required String clientId,
    required String privateKey,
    required String clientEmail,
    this.createdAt = const i0.Value.absent(),
    this.updatedAt = const i0.Value.absent(),
  }) : projectId = i0.Value(projectId),
       clientId = i0.Value(clientId),
       privateKey = i0.Value(privateKey),
       clientEmail = i0.Value(clientEmail);
  static i0.Insertable<i1.ProjectsEntity> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? name,
    i0.Expression<String>? projectId,
    i0.Expression<String>? clientId,
    i0.Expression<String>? privateKey,
    i0.Expression<String>? clientEmail,
    i0.Expression<DateTime>? createdAt,
    i0.Expression<DateTime>? updatedAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (projectId != null) 'project_id': projectId,
      if (clientId != null) 'client_id': clientId,
      if (privateKey != null) 'private_key': privateKey,
      if (clientEmail != null) 'client_email': clientEmail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  i1.ProjectsTableCompanion copyWith({
    i0.Value<int>? id,
    i0.Value<String?>? name,
    i0.Value<String>? projectId,
    i0.Value<String>? clientId,
    i0.Value<String>? privateKey,
    i0.Value<String>? clientEmail,
    i0.Value<DateTime>? createdAt,
    i0.Value<DateTime?>? updatedAt,
  }) {
    return i1.ProjectsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      clientId: clientId ?? this.clientId,
      privateKey: privateKey ?? this.privateKey,
      clientEmail: clientEmail ?? this.clientEmail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (projectId.present) {
      map['project_id'] = i0.Variable<String>(projectId.value);
    }
    if (clientId.present) {
      map['client_id'] = i0.Variable<String>(clientId.value);
    }
    if (privateKey.present) {
      map['private_key'] = i0.Variable<String>(privateKey.value);
    }
    if (clientEmail.present) {
      map['client_email'] = i0.Variable<String>(clientEmail.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = i0.Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('projectId: $projectId, ')
          ..write('clientId: $clientId, ')
          ..write('privateKey: $privateKey, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}
