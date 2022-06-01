import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppStateEvent {}

class FactHistory extends AppStateEvent {}

class HistoryDismissed extends AppStateEvent {}

class AppState {
  AppState({this.historySelected = false});

  final bool historySelected;

  AppState copyWith({bool showHistory = false}) =>
      AppState(historySelected: showHistory);
}

class AppStateManager extends Bloc<AppStateEvent, AppState> {
  AppStateManager() : super(AppState(historySelected: false)) {
    on<FactHistory>((event, emit) {
      emit(state.copyWith(showHistory: true));
    });
    on<HistoryDismissed>((event, emit) {
      emit(state.copyWith(showHistory: false));
    });
  }
}
