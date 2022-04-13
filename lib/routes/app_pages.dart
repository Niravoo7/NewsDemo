import 'package:demo_news/controllers/news_headline_binding.dart';
import 'package:demo_news/presentation/pages/news/news.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.newsPage,
        page: () => const NewsPage(),
        binding: NewsHeadlineBinding(),
        transition: Transition.downToUp),
  ];
}
