import 'package:blog/core/models/fact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';

class HistoryCubit extends Cubit<int> {
  HistoryCubit({required this.repository}) : super(1);

  final Repository repository;

  List<Fact> get facts => repository.facts;
}
