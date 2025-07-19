import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'breathe_items_database.g.dart';

class BreatheItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get techniqueName => text()();

  IntColumn get duration => integer()();

  DateTimeColumn get loggedAt => dateTime()();
}

@DriftDatabase(tables: [BreatheItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'breathe_items.db'));
    return NativeDatabase(file); 
  });
}
