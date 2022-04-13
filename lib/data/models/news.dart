import 'package:demo_news/domain/entities/article.dart';
import 'package:demo_news/domain/entities/news.dart';

import 'article.dart';

class NewsModel extends News {
  NewsModel({
    status,
    totalResults,
    articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List<Article> articles = [];
    if (json['articles'] != null) {
      json['articles'].forEach((value) {
        articles.add(ArticleModel.fromJson(value));
      });
    }

    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }
}
