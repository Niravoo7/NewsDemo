import 'package:demo_news/domain/entities/article.dart';

abstract class NewsRepositoryInterface {
  Future<List<Article>?> fetchNews();
}
