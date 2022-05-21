import 'package:blog/core/bloc/app_state_manager.dart';
import 'package:blog/core/bloc/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../core/data/repository.dart';
import '../../core/models/pages.dart';

class HistoryPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.history,
      key: ValueKey(Pages.history),
      child: const HistoryPage(),
    );
  }

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryCubit>(
            create: (_) => HistoryCubit(repository: GetIt.I.get<Repository>())),
        BlocProvider<AppStateManager>(
            create: (_) => GetIt.I.get<AppStateManager>())
      ],
      child: WillPopScope(
        onWillPop: () async {
          context.read<AppStateManager>().add(HistoryDismissed());
          return true;
        },
        child: Scaffold(
            appBar: AppBar(),
            body: Center(child:
                BlocBuilder<HistoryCubit, int>(builder: (context, state) {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: context.read<HistoryCubit>().facts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Theme.of(context).cardColor,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          child: ListTile(
                            title: Text(
                                context.read<HistoryCubit>().facts[index].text),
                            subtitle: Text(DateFormat.yMMMd(
                                    Localizations.maybeLocaleOf(context)
                                        ?.toLanguageTag())
                                .format(context
                                    .read<HistoryCubit>()
                                    .facts[index]
                                    .createdAt)),
                          ),
                        ));
                  });
            }))),
      ),
    );
  }
}
