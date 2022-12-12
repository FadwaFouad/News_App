import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/articel_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    // foramt the date of article
    var dateFormat =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(article.publishedAt);
    var articledDate = "${dateFormat.hour} : ${dateFormat.minute}";
    return Container(
      child: Column(
        children: [
          Image.network(
            article.urlToImage,
            errorBuilder: (context, error, stackTrace) {
              return Text("No image");
            },
          ),
          Text(article.title),
          Text(article.author),
          Text(articledDate)
        ],
      ),
    );
  }
}
