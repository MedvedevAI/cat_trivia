import 'package:cat_trivia/domain/data_source/fact_cat_remote_data_source.dart';
import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';
import 'package:cat_trivia/remote/fact_cat_rest_api.dart';
import 'package:cat_trivia/remote/model/fact_cat_remote_model.dart';
import 'package:http/http.dart';

class FactCatRemoteDataSourceImpl implements FactCatRemoteDataSource {
  FactCatRemoteDataSourceImpl({
    required FactCatRestApi factCatRestApi,
  }) : _factCatRestApi = factCatRestApi;

  final FactCatRestApi _factCatRestApi;

  @override
  Future<CatFact> getCatFact() async {
    var remoteCatFact = await _factCatRestApi.getFactCat();
    var responseData = await get(Uri.parse('https://cataas.com/cat'));
    final uint8list = responseData.bodyBytes;

    return remoteCatFact.toCatFact(image: uint8list);
  }
}
