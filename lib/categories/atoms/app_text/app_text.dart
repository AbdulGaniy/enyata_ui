import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';



part 'params.dart';

/// This is a wrapper for [Text] widget
/// This widget is used to display text in the app
/// It accepts [AppTextParams] as a parameter
class AppText extends StatelessWidget {
  final AppTextParams params;

  const AppText({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      params.text,
      style: _getTextStyle(context),
      textAlign: params.textAlign,
      overflow: params.overflow,
      maxLines: params.maxLines,
      textScaleFactor: 1,
    );
  }

  TextStyle? _getTextStyle(BuildContext context) {
    final mapOfStyleToStyle = _getMapOfStyleToStyle(context);
    final textStyle = mapOfStyleToStyle[params.textStyle];
    return textStyle?.copyWith(
      color: params.color,
      fontSize: params.fontSize,
      decoration: params.decoration,
      fontWeight: params.fontWeight,
    );
  }

  /// This is a map of [AppTextStyles] to [TextStyle] from [ThemeData.textTheme]
  Map<AppTextStyles, TextStyle?> _getMapOfStyleToStyle(BuildContext context) {
    return {
      AppTextStyles.h1: context.textTheme.displayLarge,
      AppTextStyles.h2: context.textTheme.displayMedium,
      AppTextStyles.h3: context.textTheme.displaySmall,
      AppTextStyles.h4: context.textTheme.headlineLarge,
      AppTextStyles.h5: context.textTheme.headlineMedium,
      AppTextStyles.h6: context.textTheme.headlineSmall,
      AppTextStyles.subtitle1: context.textTheme.labelLarge,
      AppTextStyles.subtitle2: context.textTheme.labelSmall,
      AppTextStyles.bodyMedium: context.textTheme.bodyLarge,
      AppTextStyles.bodyRegular: context.textTheme.bodyMedium,
      AppTextStyles.bodySmall: context.textTheme.bodySmall,
      AppTextStyles.bodyVerySmall: context.textTheme.labelSmall,
      AppTextStyles.bodyBold: context.textTheme.bodyLarge,
      AppTextStyles.bodyHeavy: context.textTheme.bodyLarge
    };
  }
}
