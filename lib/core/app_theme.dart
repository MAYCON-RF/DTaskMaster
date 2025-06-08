
import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF000000);
  static const primary = Color(0xFF3D52E8);
  static const primaryLight = Color(0xFF877FDF);
  static const blueGradientStart = Color(0xFF9BE6F3);
  static const blueGradientEnd = Color(0xFF3D52E8);
  static const textLight = Color(0xFFFFFFFF);
  static const textSubtitle = Color(0xFFFFFFFF);
  static const borderLight = Color(0xFFD4D3D2);
  static const indicatorInactive = Colors.white30;
  static const textDark = Color(0xFF000000); // preto
  static const borderDark = Color(0xFF000000); // borda preta
}

class AppTextStyles {
  static const title = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.primary,
  );

  static const social = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textDark,
  );

  static const subtitle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textLight,
  );

  static const button = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
  );

  static const link = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
}

class AppGradients {
  static const button = LinearGradient(
    colors: [AppColors.blueGradientStart, AppColors.blueGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
