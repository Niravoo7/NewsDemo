import 'package:demo_news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'news_card.dart';

class NewsGrid extends StatefulWidget {
  final List<Article> newsArticles;

  const NewsGrid({Key? key, required this.newsArticles}) : super(key: key);

  @override
  State<NewsGrid> createState() => _NewsGridState();
}

class _NewsGridState extends State<NewsGrid> {
  @override
  Widget build(BuildContext context) {
    return ReorderableGridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: widget.newsArticles.length,
        itemBuilder: (context, index) => Container(
            key: UniqueKey(),
            child: NewsCard(article: widget.newsArticles[index])),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            final item = widget.newsArticles.removeAt(oldIndex);
            widget.newsArticles.insert(newIndex, item);
          });
        },
        dragWidgetBuilder: (index, child) {
          return NewsCard(article: widget.newsArticles[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2));
  }
}
