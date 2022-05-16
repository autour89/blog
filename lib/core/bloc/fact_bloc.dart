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

      repository.add(fact);

      PaintingBinding.instance.imageCache.clear();
      // String locale = Localizations.localeOf(context).languageCode;
      // DateTime now = new DateTime.now();
      // String dayOfWeek = DateFormat.EEEE(locale).format(now);
      // String dayMonth = DateFormat.MMMMd(Localizations.localeOf(context).languageCode).format(now);
      // String year = DateFormat.y(locale).format(now);

      emit(SuccessState());
    } catch (e) {
      emit(FailureState());
    }
  }
}
