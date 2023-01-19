import 'package:cat_trivia/cache/cat_fact/cat_facts_cache.dart';
import 'package:cat_trivia/domain/data_source/fact_cat_remote_data_source.dart';
import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';

class CatFactService {
  const CatFactService(this._factCatRemoteDataSource, this._catFactsCacheRepo);

  final FactCatRemoteDataSource _factCatRemoteDataSource;
  final CatFactsCache _catFactsCacheRepo;

  Future<CatFact> getCatFact() async {
    final fact = await _factCatRemoteDataSource.getCatFact();
    _catFactsCacheRepo.addCatFact(fact);

    return fact;
  }

  Future<List<CatFact>> getCachedCatFacts() async {
    return _catFactsCacheRepo.getCatFacts();
  }
}
