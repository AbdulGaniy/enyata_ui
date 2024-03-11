part of 'app_text.dart';

/// Params for [AppText]
class AppTextParams {
  /// Text to display
  final String text;

  /// [AppTextStyles] to use, the default is [AppTextStyles.bodyRegular]
  /// it is mapped directly to figma styles
  final AppTextStyles? textStyle;

  /// [TextAlign] to use, the default is [TextAlign.start]
  final TextAlign? textAlign;

  /// [TextOverflow] to use, the default is [TextOverflow.ellipsis]
  final TextOverflow? overflow;

  /// [maxLines] to use, the default is 2
  final int? maxLines;

  /// [expands] to expand, the default is trye
  final bool? expands;

  /// [TextDecoration] to use, the default is [TextDecoration.none]
  final TextDecoration? decoration;

  /// [Color] to use, the default is [ColorScheme.onSurface]
  final Color? color;

  /// [FontWeight] to use, the default is [FontWeight.normal]
  final FontWeight? fontWeight;

  ///lineheight for fonts
  final double? lineHeight;

  /// [FontSize] to use,
  final double? fontSize;

  const AppTextParams({
    required this.text,
    this.textStyle,
    this.textAlign,
    this.overflow,
    this.maxLines = 2,
    this.decoration,
    this.color,
    this.lineHeight,
    this.expands,
    this.fontSize,
    this.fontWeight,
  });
}

/// This is a list of [AppTextStyles] to use in [AppText]
enum AppTextStyles {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  subtitle1,
  subtitle2,
  bodyMedium,
  bodyBold,
  bodySemiBold,
  bodyRegular,
  bodySmall,
  bodyVerySmall,
  bodyHeavy,
}
