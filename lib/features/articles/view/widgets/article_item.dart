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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
                imageUrl: article.urlToImage,
                errorWidget: (context, url, error) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.chainBroken,
                          color: Colors.grey,
                        ),
                        Text(
                          "Could not load this image",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              article.title,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Text(
              article.author,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              articleDateFormat,
              style: TextStyle(
                color: Color.fromARGB(255, 177, 72, 72),
              ),
            )
          ],
        ),
      ),
    );
  }
}
