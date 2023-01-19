import 'package:cat_trivia/domain/data_source/fact_cat_remote_data_source.dart';
import 'package:cat_trivia/remote/fact_cat_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_provider.dart';
import 'fact_cat_rest_api.dart';

extension RemoteInjector on GetIt {
  void registerRemote({
    required String baseUrl,
  }) {
    this
      ..registerLazySingleton<PrettyDioLogger>(
        () => PrettyDioLogger(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: false,
        ),
      )
      ..registerLazySingleton<Dio>(
        () => DioProvider.create(
          baseUrl: baseUrl,
          logger: get<PrettyDioLogger>(),
        ),
      )
      ..registerLazySingleton<FactCatRestApi>(
        () => FactCatRestApi(get()),
      )
      ..registerLazySingleton<FactCatRemoteDataSource>(
        () => FactCatRemoteDataSourceImpl(factCatRestApi: get()),
      );
  }
}
