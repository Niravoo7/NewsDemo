import 'package:demo_news/core/date_tools.dart';
import 'package:demo_news/domain/entities/article.dart';
import 'package:demo_news/presentation/constants/app_colors.dart';
import 'package:demo_news/presentation/constants/app_styles.dart';
import 'package:demo_news/presentation/constants/app_texts.dart';
import 'package:flutter/material.dart';

import 'news_image.dart';
import 'news_overlay.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrey,
      elevation: 10.0,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: AppColors.black,
                child: NewsImage(imageUrl: article.urlToImage),
              ),
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: NewsOverlay(),
            ),
            Positioned(
              left: 12.0,
              right: 12.0,
              bottom: 36.0,
              child: Text(
                article.title ??
                    article.description ??
                    article.content ??
                    AppTexts.txtEmpty,
                style: AppStyles.robotoSlabRegular,
                maxLines: 3,
              ),
            ),
            Positioned(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      article.source?.name ?? AppTexts.txtEmpty,
                      style: AppStyles.robotoSlabBold.copyWith(
                        fontSize: 12.0,
                        color: AppColors.lightGrey,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    '   ${DateTools.formatDate(article.publishedAt ?? AppTexts.txtEmpty)}',
                    style: AppStyles.robotoSlabRegular.copyWith(
                      fontSize: 12.0,
                      color: AppColors.lightGrey,
                    ),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
