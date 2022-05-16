part of 'fact_bloc.dart';

abstract class FactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FactFetched extends FactEvent {}
