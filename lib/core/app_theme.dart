import 'package:flutter/material.dart';

class AppColors {
  static const background = Colors.black;
  static const titlePrimary = Color(0xFFFEDC56);
  static const accent = Color(0xFF715CF5);
  static const textLight = Colors.white;
  static const textSubtitle = Colors.white70;
  static const indicatorInactive = Colors.white30;
}



class AppTextStyles {
  static const title = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: AppColors.titlePrimary,
    height: 1.3,
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    height: 1.5,
  );
}



class AppGradients {
  static const button = LinearGradient(
    colors: [
      Color(0xFF90E0EF),
      Color(0xFF2C36E6),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
