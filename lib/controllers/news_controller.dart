import 'package:demo_news/data/repositories/news_repository.dart';
import 'package:demo_news/domain/entities/article.dart';
import 'package:get/get.dart';

enum NewsPageCallState { newsLoading, newsLoaded, newsSuccess, newsFailure }

class NewsPageController extends GetxController {
  late NewsRepository _newsRepo;
  Rx<NewsPageCallState> state = NewsPageCallState.newsLoading.obs;

  NewsPageController() {
    _newsRepo = Get.find<NewsRepository>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  late List<Article>? articles = [];

  loadNewsLine() async {
    state.value = NewsPageCallState.newsLoading;

    final result = await _newsRepo.fetchNews();
    state.value = NewsPageCallState.newsLoaded;

    if (result != null) {
      state.value = NewsPageCallState.newsSuccess;
      state.refresh();
      articles = result.obs;
    } else {
      state.value = NewsPageCallState.newsFailure;
    }
  }
}
