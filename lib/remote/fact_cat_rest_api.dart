import 'package:cat_trivia/remote/model/fact_cat_remote_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'fact_cat_rest_api.g.dart';

@RestApi()
abstract class FactCatRestApi {
  factory FactCatRestApi(Dio dio) = _FactCatRestApi;

  @GET('/fact')
  Future<FactCatRemoteModel> getFactCat();

}