import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}

class AuthCurrentState {
  AuthCurrentState();

  AuthCurrentState copyWith(bool showHistory) => AuthCurrentState();
}

class AuthBloc extends Bloc<AuthEvent, AuthCurrentState> {
  AuthBloc() : super(AuthCurrentState()) {}
}
