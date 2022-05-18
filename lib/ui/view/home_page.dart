import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../core/bloc/fact_bloc.dart';
import '../../core/data/repository.dart';
import '../../core/network/api_client.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FactBloc(
          httpClient: GetIt.I.get<ApiClient>(),
          repository: GetIt.I.get<Repository>()),
      child: const HomeView(),
    );
  }
}
