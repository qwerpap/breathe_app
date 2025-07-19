// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathe_items_database.dart';

// ignore_for_file: type=lint
class $BreatheItemsTable extends BreatheItems
    with TableInfo<$BreatheItemsTable, BreatheItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BreatheItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _techniqueNameMeta = const VerificationMeta(
    'techniqueName',
  );
  @override
  late final GeneratedColumn<String> techniqueName = GeneratedColumn<String>(
    'technique_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, techniqueName, duration, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'breathe_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<BreatheItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('technique_name')) {
      context.handle(
        _techniqueNameMeta,
        techniqueName.isAcceptableOrUnknown(
          data['technique_name']!,
          _techniqueNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_techniqueNameMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreatheItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BreatheItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      techniqueName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}technique_name'],
          )!,
      duration:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}duration'],
          )!,
      loggedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}logged_at'],
          )!,
    );
  }

  @override
  $BreatheItemsTable createAlias(String alias) {
    return $BreatheItemsTable(attachedDatabase, alias);
  }
}

class BreatheItem extends DataClass implements Insertable<BreatheItem> {
  final int id;
  final String techniqueName;
  final int duration;
  final DateTime loggedAt;
  const BreatheItem({
    required this.id,
    required this.techniqueName,
    required this.duration,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['technique_name'] = Variable<String>(techniqueName);
    map['duration'] = Variable<int>(duration);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  BreatheItemsCompanion toCompanion(bool nullToAbsent) {
    return BreatheItemsCompanion(
      id: Value(id),
      techniqueName: Value(techniqueName),
      duration: Value(duration),
      loggedAt: Value(loggedAt),
    );
  }

  factory BreatheItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BreatheItem(
      id: serializer.fromJson<int>(json['id']),
      techniqueName: serializer.fromJson<String>(json['techniqueName']),
      duration: serializer.fromJson<int>(json['duration']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'techniqueName': serializer.toJson<String>(techniqueName),
      'duration': serializer.toJson<int>(duration),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  BreatheItem copyWith({
    int? id,
    String? techniqueName,
    int? duration,
    DateTime? loggedAt,
  }) => BreatheItem(
    id: id ?? this.id,
    techniqueName: techniqueName ?? this.techniqueName,
    duration: duration ?? this.duration,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  BreatheItem copyWithCompanion(BreatheItemsCompanion data) {
    return BreatheItem(
      id: data.id.present ? data.id.value : this.id,
      techniqueName:
          data.techniqueName.present
              ? data.techniqueName.value
              : this.techniqueName,
      duration: data.duration.present ? data.duration.value : this.duration,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BreatheItem(')
          ..write('id: $id, ')
          ..write('techniqueName: $techniqueName, ')
          ..write('duration: $duration, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, techniqueName, duration, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreatheItem &&
          other.id == this.id &&
          other.techniqueName == this.techniqueName &&
          other.duration == this.duration &&
          other.loggedAt == this.loggedAt);
}

class BreatheItemsCompanion extends UpdateCompanion<BreatheItem> {
  final Value<int> id;
  final Value<String> techniqueName;
  final Value<int> duration;
  final Value<DateTime> loggedAt;
  const BreatheItemsCompanion({
    this.id = const Value.absent(),
    this.techniqueName = const Value.absent(),
    this.duration = const Value.absent(),
    this.loggedAt = const Value.absent(),
  });
  BreatheItemsCompanion.insert({
    this.id = const Value.absent(),
    required String techniqueName,
    required int duration,
    required DateTime loggedAt,
  }) : techniqueName = Value(techniqueName),
       duration = Value(duration),
       loggedAt = Value(loggedAt);
  static Insertable<BreatheItem> custom({
    Expression<int>? id,
    Expression<String>? techniqueName,
    Expression<int>? duration,
    Expression<DateTime>? loggedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (techniqueName != null) 'technique_name': techniqueName,
      if (duration != null) 'duration': duration,
      if (loggedAt != null) 'logged_at': loggedAt,
    });
  }

  BreatheItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? techniqueName,
    Value<int>? duration,
    Value<DateTime>? loggedAt,
  }) {
    return BreatheItemsCompanion(
      id: id ?? this.id,
      techniqueName: techniqueName ?? this.techniqueName,
      duration: duration ?? this.duration,
      loggedAt: loggedAt ?? this.loggedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (techniqueName.present) {
      map['technique_name'] = Variable<String>(techniqueName.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreatheItemsCompanion(')
          ..write('id: $id, ')
          ..write('techniqueName: $techniqueName, ')
          ..write('duration: $duration, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BreatheItemsTable breatheItems = $BreatheItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [breatheItems];
}

typedef $$BreatheItemsTableCreateCompanionBuilder =
    BreatheItemsCompanion Function({
      Value<int> id,
      required String techniqueName,
      required int duration,
      required DateTime loggedAt,
    });
typedef $$BreatheItemsTableUpdateCompanionBuilder =
    BreatheItemsCompanion Function({
      Value<int> id,
      Value<String> techniqueName,
      Value<int> duration,
      Value<DateTime> loggedAt,
    });

class $$BreatheItemsTableFilterComposer
    extends Composer<_$AppDatabase, $BreatheItemsTable> {
  $$BreatheItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get techniqueName => $composableBuilder(
    column: $table.techniqueName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BreatheItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $BreatheItemsTable> {
  $$BreatheItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get techniqueName => $composableBuilder(
    column: $table.techniqueName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BreatheItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BreatheItemsTable> {
  $$BreatheItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get techniqueName => $composableBuilder(
    column: $table.techniqueName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$BreatheItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BreatheItemsTable,
          BreatheItem,
          $$BreatheItemsTableFilterComposer,
          $$BreatheItemsTableOrderingComposer,
          $$BreatheItemsTableAnnotationComposer,
          $$BreatheItemsTableCreateCompanionBuilder,
          $$BreatheItemsTableUpdateCompanionBuilder,
          (
            BreatheItem,
            BaseReferences<_$AppDatabase, $BreatheItemsTable, BreatheItem>,
          ),
          BreatheItem,
          PrefetchHooks Function()
        > {
  $$BreatheItemsTableTableManager(_$AppDatabase db, $BreatheItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BreatheItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$BreatheItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$BreatheItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> techniqueName = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
              }) => BreatheItemsCompanion(
                id: id,
                techniqueName: techniqueName,
                duration: duration,
                loggedAt: loggedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String techniqueName,
                required int duration,
                required DateTime loggedAt,
              }) => BreatheItemsCompanion.insert(
                id: id,
                techniqueName: techniqueName,
                duration: duration,
                loggedAt: loggedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BreatheItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BreatheItemsTable,
      BreatheItem,
      $$BreatheItemsTableFilterComposer,
      $$BreatheItemsTableOrderingComposer,
      $$BreatheItemsTableAnnotationComposer,
      $$BreatheItemsTableCreateCompanionBuilder,
      $$BreatheItemsTableUpdateCompanionBuilder,
      (
        BreatheItem,
        BaseReferences<_$AppDatabase, $BreatheItemsTable, BreatheItem>,
      ),
      BreatheItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BreatheItemsTableTableManager get breatheItems =>
      $$BreatheItemsTableTableManager(_db, _db.breatheItems);
}
