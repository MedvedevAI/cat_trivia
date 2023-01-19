import 'package:cat_trivia/cache/common/database/database.dart';
import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';

class CatFactEntityMapper {
  static CatFactEntity fromDto(CatFact catFact) {
    return CatFactEntity(
      fact: catFact.fact,
      image: catFact.image,
      creationDate: catFact.creationDate,
      id: 0,
    );
  }

  static CatFact toDto(CatFactEntity catFactEntity) {
    return CatFact(
      fact: catFactEntity.fact,
      image: catFactEntity.image,
      creationDate: catFactEntity.creationDate,
    );
  }
}
