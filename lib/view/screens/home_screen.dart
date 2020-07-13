import 'package:flutter/material.dart';
import 'package:news_feed/view/screens/pages/about_us_page.dart';
import 'package:news_feed/view/screens/pages/head_line_page.dart';
import 'package:news_feed/view/screens/pages/news_list_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final _pages = [
    HeadLinePage(), NewsListPage(), AboutUsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              title: const Text("トップニュース"),
              icon: const Icon(Icons.highlight) // constつけると再生成されない
            ),
            BottomNavigationBarItem(
              title: Text("ニュース一覧"),
              icon: Icon(Icons.list)
            ),
            BottomNavigationBarItem(
              title: Text("このアプリについて"),
              icon: Icon(Icons.info)
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
