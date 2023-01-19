import 'dart:typed_data';

import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_cat_remote_model.freezed.dart';

part 'fact_cat_remote_model.g.dart';

@freezed
class FactCatRemoteModel with _$FactCatRemoteModel {
  const factory FactCatRemoteModel({
    required String fact,
  }) = _FactCatRemoteModel;

  factory FactCatRemoteModel.fromJson(Map<String, dynamic> json) => _$FactCatRemoteModelFromJson(json);
}

extension FactCatRemoteModelMapper on FactCatRemoteModel {
  CatFact toCatFact({required Uint8List image}) {
    return CatFact(
      fact: fact,
      image: image,
      creationDate: DateTime.now(),
    );
  }
}
