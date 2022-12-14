import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/features/articles/view/widgets/article_item.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/articel_model.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({required this.article, super.key});
  final Article article;
  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    //remove rest of article content
    var content = widget.article.content;
    List<String> contentSplit = content.split("[");
    var articleContent = content.replaceAll(contentSplit.last, "");

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () async {
            await Share.share("hi, check this news ${widget.article.url}");
          },
          icon: const FaIcon(FontAwesomeIcons.share),
        ),
      ]),
      body: ListView(
        children: [
          ArticleItem(
            article: widget.article,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(widget.article.description),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(articleContent),
          ),
          MaterialButton(
            onPressed: () => readMore(widget.article.url),
            color: Colors.green,
            padding: EdgeInsets.all(5),
            elevation: 15,
            // height: 60,
            child: Text("Read More"),
          ),
        ],
      ),
    );
  }

  readMore(String url) async {
    var parseUri = Uri.parse(url);
    await launchUrl(parseUri);
  }
}
