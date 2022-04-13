import 'package:demo_news/domain/entities/article.dart';
import 'package:demo_news/helper/constants.dart';
import 'package:flutter/material.dart';

import 'news_card.dart';

class NewsList extends StatefulWidget {
  final List<Article> newsArticles;

  const NewsList({Key? key, required this.newsArticles}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ReorderableListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: widget.newsArticles.length,
        itemBuilder: (context, index) {
          return Container(
              color: AppConstants.clrTransparent,
              key: UniqueKey(),
              margin: const EdgeInsets.only(bottom: 10),
              child: NewsCard(article: widget.newsArticles[index]));
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }
            final item = widget.newsArticles.removeAt(oldIndex);
            widget.newsArticles.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
