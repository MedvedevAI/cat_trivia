import 'package:drift/drift.dart';

@DataClassName('CatFactEntity')
class CatFactsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fact => text()();

  BlobColumn get image => blob()();

  DateTimeColumn get creationDate => dateTime()();
}
