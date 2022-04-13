import 'package:demo_news/domain/entities/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    source,
    title,
    description,
    urlToImage,
    publishedAt,
    content,
  }) : super(
          source: source,
          title: title,
          description: description,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class SourceModel extends Source {
  SourceModel({
    name,
  }) : super(
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      name: json['name'],
    );
  }
}
