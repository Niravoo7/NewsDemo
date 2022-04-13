import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  static TextStyle robotoSlabBold = GoogleFonts.robotoSlab(
    fontSize: 29.0,
    fontWeight: FontWeight.bold
  );

  static TextStyle robotoSlabRegular = GoogleFonts.robotoSlab(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: AppColors.offWhite
  );

  static const systemOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.black45,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: AppColors.black45,
    systemNavigationBarColor: AppColors.black45
  );
}
