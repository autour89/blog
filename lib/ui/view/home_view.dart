import 'package:blog/core/bloc/app_state_manager.dart';
import 'package:blog/core/bloc/fact_bloc.dart';
import 'package:blog/core/network/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  static const String _historyTitle = 'Fact history';
  static const String _anotherFactTitle = 'Another fact';
  static const String _loadAgainTitle = 'Try load again...';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _describeStates(context)));
  }

  Widget _describeStates(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case BusyState:
            return const CircularProgressIndicator();
          case SuccessState:
            return _onSuccessState(context);
          case FailureState:
            return TextButton(
                child: const Text(_loadAgainTitle),
                onPressed: () => context.read<FactBloc>().add(
                      FactFetched(),
                    ));
          case InitialState:
          default:
            context.read<FactBloc>().add(FactFetched());
            return Container();
        }
      },
    );
  }

  Widget _onSuccessState(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(Apis.catUrl),
                  ),
                  title: Text(context.read<FactBloc>().facts.last.text),
                  subtitle: Text(DateFormat.yMMMd(
                          Localizations.maybeLocaleOf(context)?.toLanguageTag())
                      .format(
                    context.read<FactBloc>().facts.last.createdAt,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(_historyTitle),
                      onPressed: () =>
                          context.read<AppStateManager>().add(FactHistory()),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                        child: const Text(_anotherFactTitle),
                        onPressed: () => context.read<FactBloc>().add(
                              FactFetched(),
                            )),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
