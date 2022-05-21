import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppStateEvent {}

class FactHistory extends AppStateEvent {}

class AppState {
  AppState({required this.historySelected});

  final bool historySelected;

  AppState copyWith(bool showHistory) => AppState(historySelected: showHistory);
}

class AppStateManager extends Bloc<AppStateEvent, AppState> {
  AppStateManager() : super(AppState(historySelected: false)) {
    on<FactHistory>((event, emit) {
      emit(state.copyWith(true));
    });
  }
  bool showHistory = false;
}
