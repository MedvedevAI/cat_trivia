import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';

abstract class FactCatRemoteDataSource {
  Future<CatFact> getCatFact();
}
