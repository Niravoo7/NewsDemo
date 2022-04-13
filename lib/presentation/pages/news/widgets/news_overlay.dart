import 'package:demo_news/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsOverlay extends StatelessWidget {
  const NewsOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[
            AppColors.black,
            AppColors.black70,
            AppColors.transparent
          ],
        ),
      ),
    );
  }
}
