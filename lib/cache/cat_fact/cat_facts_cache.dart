import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';

abstract class CatFactsCache {
  Future<List<CatFact>> getCatFacts();

  Future<void> addCatFact(CatFact catFact);
}
