import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';
import 'package:cat_trivia/service/cat_fact_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fact_bloc.freezed.dart';

@freezed
class FactEvent with _$FactEvent {
  const factory FactEvent.fetch() = _Fetch;
}

@freezed
abstract class FactState with _$FactState {
  const FactState._();

  const factory FactState.initial() = InitialFactState;

  const factory FactState.loading() = LoadingFactState;

  const factory FactState.loaded(CatFact catFact) = LoadedFactState;

  const factory FactState.error(dynamic failure) = ErrorFactState;
}

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc(this._catFactService) : super(FactState.initial());

  final CatFactService _catFactService;

  @override
  Stream<FactState> mapEventToState(
    FactEvent event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<FactState> _fetch(_Fetch value) async* {
    yield FactState.loading();
    try {
      final catFact = await _catFactService.getCatFact();
      yield FactState.loaded(catFact);
    } catch (e, s) {
      yield FactState.error(e);
    }
  }
}
