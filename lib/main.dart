import 'package:flutter/material.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/style/style.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider( // Providerを複数登録できる, Listの順番に登録される
      providers: [
        ChangeNotifierProvider<NewsListViewModel>(
          create: (_) =>  NewsListViewModel(),
        ),
        ChangeNotifierProvider<HeadLineViewModel>(
          create: (_) =>  HeadLineViewModel(),
        ),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: SansSerifFont
      ),
      home: HomeScreen(),
    );
  }
}
