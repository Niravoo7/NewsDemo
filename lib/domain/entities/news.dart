import 'article.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  News({
    this.status,
    this.totalResults,
    this.articles,
  });
}
