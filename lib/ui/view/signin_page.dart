import 'package:blog/core/bloc/app_state_manager.dart';
import 'package:blog/core/bloc/auth_bloc.dart';
import 'package:blog/core/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get_it/get_it.dart';

class SignInPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Pages.signIn,
      key: ValueKey(Pages.signIn),
      child: const SignInPage(),
    );
  }

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
            BlocProvider<AppStateManager>(
                create: (_) => GetIt.I.get<AppStateManager>())
          ],
          child: BlocBuilder<AuthBloc, AuthCurrentState>(
            builder: (context, state) {
              return const SignInScreen(showAuthActionSwitch: false);
            },
          )),
    );
  }
}
