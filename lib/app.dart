import 'package:blog/ui/view/history_page.dart';
import 'package:blog/ui/view/home_page.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BlogState();
}

class BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/history': (context) => const HistoryPage()
      },
      initialRoute: '/',
    );
  }
}
