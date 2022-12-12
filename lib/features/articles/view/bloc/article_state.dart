import 'package:news_app/features/articles/data/models/articel_model.dart';
import 'package:news_app/features/articles/data/repository/article_repo.dart';

class ArticleState {
  List<Article> listOfArticles;

  ArticleState({this.listOfArticles = const []});

  Future<List<Article>> getArticles() async {
    return await ArticleRepo().getArticles();
  }
}
