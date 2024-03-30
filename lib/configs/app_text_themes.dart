part of 'theme.dart';

/// App Text styles. This name is matched to the design asset in Figma. e.g H1(on figma) => displayLarge(in app)
class _AppTextStyles {
  /// H1 => displayLarge
  static TextStyle h1({
    Color? color,
  }) => TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 40,
        fontWeight: FontWeight.w400,
        height: 44 / 40,
        letterSpacing: -(0.02 * 40),
      );

  /// H2 => displayMedium
  static TextStyle h2({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 40 / 36,
        letterSpacing: -(0.02 * 36),
      );

  /// H3 => displaySmall
  static TextStyle h3({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 36 / 32,
        letterSpacing: -(0.02 * 32),
      );

  /// H4 => headlineLarge
  static TextStyle h4({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 30 / 28,
        letterSpacing: -(0.02 * 28),
      );

  /// H5 => headlineMedium
  static TextStyle h5({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 26 / 24,
      );

  /// H6 => headlineSmall
  static TextStyle h6({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 30 / 20,
      );

  /// Sub 1 => labelLarge
  static TextStyle sub1({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 23 / 18,
      );

  /// Sub 2 => labelMedium
  static TextStyle sub2({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16,
      );

  /// body Regular => bodyMedium
  static TextStyle bodyRegular({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 18 / 14,
        letterSpacing: -(0.02 * 14),
      );

  /// body large => bodyLarge
  static TextStyle bodyMedium({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16,
        letterSpacing: -(0.02 * 16),
      );

  /// body small => bodySmall
  static TextStyle bodySmall({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 15 / 12,
        letterSpacing: -(0.02 * 12),
      );

  /// body very small => labelSmall
  static TextStyle bodyVerySmall({
    Color? color,
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 15 / 10,
        letterSpacing: -(0.02 * 10),
      );
  static TextStyle bodyHeavy({
    Color? color
  }) =>
      TextStyle(
        color: color ?? AppColors.textBlack,
        fontSize: 10,
        fontWeight: FontWeight.w800,
        height: 15 / 10,
        letterSpacing: -(0.02 * 10),
      );

  static TextTheme get getLightTextTheme => TextTheme(
        displayLarge: _AppTextStyles.h1(),
        displayMedium: _AppTextStyles.h2(),
        displaySmall: _AppTextStyles.h3(),
        headlineLarge: _AppTextStyles.h4(),
        headlineMedium: _AppTextStyles.h5(),
        headlineSmall: _AppTextStyles.h6(),
        labelLarge: _AppTextStyles.sub1(),
        labelMedium: _AppTextStyles.sub2(),
        labelSmall: _AppTextStyles.bodyVerySmall(),
        bodyLarge: _AppTextStyles.bodyHeavy(),
        bodyMedium: _AppTextStyles.bodyRegular(),
        bodySmall: _AppTextStyles.bodySmall(),
      );
}
