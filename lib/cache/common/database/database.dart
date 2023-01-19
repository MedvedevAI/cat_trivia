import 'package:cat_trivia/cache/cat_fact/cat_facts_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [CatFactsTable],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        print('Migration onUpgrade call!');
        if (from != to) {
          print('Migration onUpgrade call!');
          // recreate database on schema version change
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
          }
          await m.createAll();
        }
      },
    );
  }
}
