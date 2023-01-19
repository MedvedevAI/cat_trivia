import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';
import 'package:cat_trivia/service/cat_fact_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cached_cat_facts_bloc.freezed.dart';

@freezed
class CachedCatFactsEvent with _$CachedCatFactsEvent {
  const factory CachedCatFactsEvent.fetch() = _Fetch;
}

@freezed
abstract class CachedCatFactsState with _$CachedCatFactsState {
  const CachedCatFactsState._();

  const factory CachedCatFactsState.initial() = InitialCachedCatFactsState;

  const factory CachedCatFactsState.loading() = LoadingCachedCatFactsState;

  const factory CachedCatFactsState.loaded(List<CatFact> cachedCatFact) = LoadedCachedCatFactsState;

  const factory CachedCatFactsState.error(dynamic failure) = ErrorCachedCatFactsState;
}

class CachedCatFactsBloc extends Bloc<CachedCatFactsEvent, CachedCatFactsState> {
  CachedCatFactsBloc(this._catFactService) : super(CachedCatFactsState.initial());

  final CatFactService _catFactService;

  @override
  Stream<CachedCatFactsState> mapEventToState(
    CachedCatFactsEvent event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<CachedCatFactsState> _fetch(_Fetch value) async* {
    yield CachedCatFactsState.loading();
    try {
      final catFacts = await _catFactService.getCachedCatFacts();
      yield CachedCatFactsState.loaded(catFacts);
    } catch (e, s) {
      yield CachedCatFactsState.error(e);
    }
  }
}
