import 'package:cat_trivia/cache/local_injector.dart';
import 'package:cat_trivia/remote/remote_injector.dart';
import 'package:cat_trivia/screens/cached_cat_facts/bloc/cached_cat_facts_bloc.dart';
import 'package:get_it/get_it.dart';

import 'screens/fact_screen/bloc/fact_bloc.dart';
import 'service/cat_fact_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    ..registerRemote(
      baseUrl: 'https://catfact.ninja',
    )
    ..registerLocale()
    ..registerLazySingleton(() => FactBloc(getIt.get()))
    ..registerLazySingleton(() => CachedCatFactsBloc(getIt.get()))
    //services
    ..registerLazySingleton(() => CatFactService(getIt.get(), getIt.get()));
}
