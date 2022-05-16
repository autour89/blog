import 'package:blog/core/bloc/fact_bloc.dart';
import 'package:blog/core/network/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'history_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<FactBloc, FactState>(
          builder: (context, state) {
            if (state is InitialState) {
              context.read<FactBloc>().add(FactFetched());
              return Container();
            }
            return Stack(children: [
              if (state is BusyState) ...[
                const Center(
                  child: CircularProgressIndicator(),
                )
              ],
              if (state is SuccessState) ...[
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(Apis.catUrl),
                            ),
                            title:
                                Text(context.read<FactBloc>().facts.last.text),
                            subtitle: Text(DateFormat.yMMMd(
                                    Localizations.maybeLocaleOf(context)
                                        ?.toLanguageTag())
                                .format(
                              context.read<FactBloc>().facts.last.createdAt,
                            )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Fact history'),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HistoryPage())),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                  child: const Text('Another fact'),
                                  onPressed: () => context.read<FactBloc>().add(
                                        FactFetched(),
                                      )),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
              if (state is FailureState) ...[
                Center(
                  child: TextButton(
                      child: const Text('Try load again...'),
                      onPressed: () => context.read<FactBloc>().add(
                            FactFetched(),
                          )),
                )
              ]
            ]);
          },
        ),
      ),
    );
  }
}
