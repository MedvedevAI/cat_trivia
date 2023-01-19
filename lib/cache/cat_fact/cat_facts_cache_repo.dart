import 'package:cat_trivia/cache/cat_fact/cat_facts_cache.dart';
import 'package:cat_trivia/cache/cat_fact/cat_facts_entity_mapper.dart';
import 'package:cat_trivia/cache/cat_fact/cat_facts_table.dart';
import 'package:cat_trivia/cache/common/database/database.dart';
import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';

import 'package:drift/drift.dart';

part 'cat_facts_cache_repo.g.dart';

@DriftAccessor(tables: [CatFactsTable])
class CatFactsCacheRepo extends DatabaseAccessor<MyDatabase> with _$CatFactsCacheRepoMixin implements CatFactsCache {
  CatFactsCacheRepo(MyDatabase db) : super(db);

  @override
  Future<void> addCatFact(CatFact catFact) async {
    final catFactModel = CatFactsTableCompanion(
      fact: Value(catFact.fact),
      image: Value(catFact.image),
      creationDate: Value(DateTime.now()),
    );

    await transaction(() async {
      await into(catFactsTable).insert(
        catFactModel,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  @override
  Future<List<CatFact>> getCatFacts() async {
    final catFacts = await select(catFactsTable).get();

    return catFacts.map((catFact) => CatFactEntityMapper.toDto(catFact)).toList();
  }
}
