import 'package:demo_news/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularLoading extends StatelessWidget {
  final Color? loadingColor;

  const CustomCircularLoading({Key? key, this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: AppColors.transparent,
      valueColor: AlwaysStoppedAnimation(loadingColor ?? AppColors.white),
      strokeWidth: 2.5,
    );
  }
}
