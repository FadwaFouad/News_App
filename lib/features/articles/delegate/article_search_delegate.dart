import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/features/articles/data/models/articel_model.dart';
import 'package:news_app/features/articles/view/bloc/article_bloc.dart';
import 'package:news_app/features/articles/view/widgets/article_item.dart';

class ArticleSearchDelegates extends SearchDelegate {
  List<Article> listOfArticles = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    listOfArticles = context.watch<ArticleBloc>().state.listOfArticles;
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: FaIcon(FontAwesomeIcons.x),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (listOfArticles.isEmpty) {
      return const Center(
        child: Text("Articles has not been loaded yet"),
      );
    }

    // create list
    var listOfQuery = [];

    for (var article in listOfArticles) {
      var title = article.title.toLowerCase();
      var queryLC = query.toLowerCase();
      if (title.contains(queryLC)) {
        listOfQuery.add(article);
      }
    }

    // display new list

    return ListView.builder(
      itemCount: listOfQuery.length,
      itemBuilder: (context, index) {
        return ArticleItem(
          key: Key("$index"),
          article: listOfQuery[index],
        );
      },
    );
  }
}
