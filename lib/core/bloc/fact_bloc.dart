import 'package:bloc/bloc.dart';
import 'package:blog/core/models/fact.dart';
import 'package:blog/core/network/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/repository.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc({required this.httpClient, required this.repository})
      : super(InitialState()) {
    on<FactFetched>(_onFactFetch);
  }
  final ApiClient httpClient;
  final Repository repository;

  List<Fact> get facts => repository.facts;

  Future _onFactFetch(FactEvent event, Emitter<FactState> emit) async {
    emit(BusyState());

    try {
      var fact = await httpClient.getFact();

      await repository.add(fact);

      PaintingBinding.instance.imageCache.clear();

      emit(SuccessState());
    } catch (e) {
      emit(FailureState());
    }
  }
}
