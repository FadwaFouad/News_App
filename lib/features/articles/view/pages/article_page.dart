import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/data/models/articel_model.dart';
import 'package:news_app/features/articles/view/bloc/article_bloc.dart';
import 'package:news_app/features/articles/view/bloc/article_event.dart';
import 'package:news_app/features/articles/view/widgets/article_item.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleBloc>().add(onArticleLoad());
  }

  @override
  Widget build(BuildContext context) {
    var articleBloc = context.watch<ArticleBloc>();
    List<Article> articlesList = articleBloc.state.listOfArticles;

    return articlesList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              context.read<ArticleBloc>().add(onArticleLoad());
              setState(() {});
            },
            child: ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ArticleItem(article: articlesList[index]),
                    Divider(),
                  ],
                );
              },
            ),
          );
  }
}
