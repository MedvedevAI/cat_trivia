import 'package:cat_trivia/cache/cat_fact/cat_facts_cache.dart';
import 'package:cat_trivia/cache/cat_fact/cat_facts_cache_repo.dart';
import 'package:cat_trivia/cache/common/database/database.dart';
import 'package:get_it/get_it.dart';

extension LocalInjector on GetIt {
  Future<void> registerLocale() async {
    this
      ..registerLazySingleton<MyDatabase>(() => MyDatabase())
      ..registerLazySingleton<CatFactsCache>(() => CatFactsCacheRepo(GetIt.I<MyDatabase>()));
  }
}
