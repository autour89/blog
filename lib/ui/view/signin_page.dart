import 'package:blog/core/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

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
      appBar: AppBar(),
      body: SignInScreen(
        subtitleBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              action == AuthAction.signIn
                  ? 'Welcome to FlutterFire UI! Please sign in to continue.'
                  : 'Welcome to FlutterFire UI! Please create an account to continue',
            ),
          );
        },
        footerBuilder: (context, _) {
          return const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'By signing in, you agree to our terms and conditions.',
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
