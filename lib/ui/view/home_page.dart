import 'package:blog/core/bloc/app_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../core/bloc/fact_bloc.dart';
import '../../core/data/repository.dart';
import '../../core/models/pages.dart';
import '../../core/network/api_client.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.home,
      key: ValueKey(Pages.home),
      child: const HomePage(),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FactBloc>(
          create: (_) => FactBloc(
              httpClient: GetIt.I.get<ApiClient>(),
              repository: GetIt.I.get<Repository>()),
        ),
        BlocProvider<AppStateManager>(
            create: (_) => GetIt.I.get<AppStateManager>())
      ],
      child: const HomeView(),
    );
  }
}
