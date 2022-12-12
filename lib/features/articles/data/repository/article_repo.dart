import 'package:news_app/features/articles/data/models/articel_model.dart';
import 'package:news_app/services/news_api_service.dart';

class ArticleRepo {
  var articleService = NewsApiService();

  Future<List<Article>> getArticles() async {
    return await articleService.getAllArticles();
  }
}
