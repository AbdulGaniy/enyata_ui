import 'package:flutter/material.dart';

import 'colors.dart';

part 'app_text_themes.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: _AppTextStyles.getLightTextTheme,
    primaryColor: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Inter',
    package: 'ui_package',
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      tertiary: AppColors.activeColor,
      background: AppColors.backgroundColor,
      onPrimary: AppColors.whiteColor,
      onBackground: AppColors.blackColor,
      onSecondary: AppColors.whiteColor,
      onError: AppColors.whiteColor,
      error: AppColors.errorColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.textBlack,
      outline: AppColors.gray,
    ),
  );
}
