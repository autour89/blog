import 'package:blog/ui/view/history_page.dart';
import 'package:blog/ui/view/home_page.dart';
import 'package:blog/ui/view/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/app_state_manager.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BlogState();
}

class BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInPage();
          }
          return FlowBuilder(
            state: context.watch<AppStateManager>().state,
            onGeneratePages: onGeneratePages,
          );
        },
      ),
    );
  }

  List<Page> onGeneratePages(AppState state, List<Page> pages) {
    return [
      HomePage.page(),
      if (state.historySelected) HistoryPage.page(),
    ];
  }
}
