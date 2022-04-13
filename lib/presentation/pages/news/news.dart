import 'package:demo_news/controllers/news_controller.dart';
import 'package:demo_news/presentation/constants/app_styles.dart';
import 'package:demo_news/presentation/constants/app_texts.dart';
import 'package:demo_news/presentation/constants/themes/theme_service.dart';
import 'package:demo_news/presentation/pages/global/widgets/custom_app_bar.dart';
import 'package:demo_news/presentation/pages/global/widgets/custom_circular_loading.dart';
import 'package:demo_news/presentation/pages/news/widgets/news_grid.dart';
import 'package:demo_news/presentation/pages/news/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<NewsPageController>();
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: CustomAppBar(
            title: Text(AppTexts.txtHeadlines.toUpperCase(),
                style: AppStyles.robotoSlabBold),
            action: Switch(
                value: ThemeService().theme == ThemeMode.dark,
                activeColor: Colors.grey,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white,
                onChanged: (value) {
                  ThemeService().switchTheme();
                })),
        body: Obx(
          () {
            Widget? widget;
            if (controller.state.value == NewsPageCallState.newsLoading) {
              widget = const CustomCircularLoading();
            } else if (controller.state.value ==
                NewsPageCallState.newsFailure) {
              widget = Text(
                AppTexts.msgServerDown,
                style: AppStyles.robotoSlabRegular,
                textAlign: TextAlign.center,
              );
            } else if (controller.state.value ==
                NewsPageCallState.newsSuccess) {
              widget = (controller.articles != null &&
                      controller.articles!.isNotEmpty)
                  ? (size.height > size.width)
                      ? NewsList(newsArticles: controller.articles!)
                      : NewsGrid(newsArticles: controller.articles!)
                  : Text(AppTexts.msgNoNewsFound,
                      style: AppStyles.robotoSlabRegular,
                      textAlign: TextAlign.center);
            }
            return Center(child: widget);
          },
        ));
  }
}
