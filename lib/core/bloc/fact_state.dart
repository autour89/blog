part of 'fact_bloc.dart';

abstract class FactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends FactState {
  @override
  String toString() => 'Initial state';
}

class BusyState extends FactState {
  @override
  String toString() => 'Busy state';
}

class SuccessState extends FactState {
  @override
  String toString() => 'Success state';
}

class FailureState extends FactState {
  @override
  String toString() => 'Failure state';
}
