import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/features/articles/delegate/article_search_delegate.dart';
import 'package:news_app/features/articles/view/pages/article_page.dart';
import 'package:news_app/features/favorites/view/pages/fav_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ArticleSearchDelegates());
            },
            icon: const FaIcon(FontAwesomeIcons.searchengin),
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ArticlePage(),
          FavPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: ((index) => setState(() {
                _currentIndex = index;
              })),
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.heart),
              label: "Favorites",
            ),
          ]),
    );
  }
}
