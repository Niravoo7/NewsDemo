import 'package:demo_news/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onBackPressed;

  const CustomBackButton({Key? key, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: AppColors.black45, // Button color
        child: InkWell(
          splashColor: AppColors.black, // Splash color
          onTap: onBackPressed,
          child: const SizedBox(
            width: 42,
            height: 42,
            child: Icon(
              Icons.arrow_back_outlined,
              size: 32,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
