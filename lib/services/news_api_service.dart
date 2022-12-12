import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/features/articles/data/models/articel_model.dart';

class NewsApiService {
  final _baseUrl = "https://newsapi.org/v2/";
  final _apiKey = "d8cdb246c8d442bbbef717ec4f976273";

  Future<List<Article>> getAllArticles() async {
    var endpoint = "top-headlines?country=ng&apiKey=$_apiKey";
    var fullURL = _baseUrl + endpoint;

    List<Article> articlesList = [];

    // make http request
    http.Response responce = await http.get(Uri.parse(fullURL));

    Map<String, dynamic> responceBody = jsonDecode(responce.body);

    var jsonArticles = responceBody["articles"];

    for (Map<String, dynamic> item in jsonArticles) {
      var article = Article.fromJson(item);
      articlesList.add(article);
    }

    return articlesList;
  }
}
