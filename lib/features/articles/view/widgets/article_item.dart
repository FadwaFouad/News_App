import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/articles/view/pages/article_details.dart';

import '../../data/models/articel_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    // foramt  date of article
    var dateParse =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(article.publishedAt);
    var articleDateFormat = DateFormat("yyyy-MM-dd HH:mm").format(dateParse);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return ArticleDetails(article: article);
        }));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage,
              errorWidget: (context, url, error) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.chainBroken),
                      Text("Could not load this image")
                    ],
                  ),
                );
              },
            ),
            Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(article.author),
            Text(articleDateFormat)
          ],
        ),
      ),
    );
  }
}
