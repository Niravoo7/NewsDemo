import 'package:demo_news/data/repositories/news_repository.dart';
import 'package:get/get.dart';

import 'news_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepository());
    Get.put(NewsPageController());
  }
}
