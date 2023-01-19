import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

mixin DioProvider {
  static String dioAuth = 'DioAuth';

  static Dio create({
    required String baseUrl,
    required PrettyDioLogger logger,
  }) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.responseType = ResponseType.json;

    if (!kReleaseMode) {
      dio.interceptors.add(logger);
    }

    return dio;
  }


}
