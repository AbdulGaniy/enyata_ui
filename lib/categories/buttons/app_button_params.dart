part of 'app_button.dart';

class AppButtonParams {
  final bool isOutline;
  final bool isDisabled;
  final bool isFullWidth;

  /// Either text or child must be provided
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;

  /// Either text or child must be provided
  /// If both are provided, child will be used
  ///
  final Widget? child;
  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
  final Color? outlineColor;
  final double radius;
  final TextStyle? textStyle;

  const AppButtonParams({
    this.isOutline = false,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.text,
    this.backgroundColor,
    this.width,
    this.height = 50,
    this.isLoading = false,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.onPressed,
    this.child,
    this.outlineColor,
    this.textStyle,
    this.radius = 10,
  }) : assert(text != null || child != null);
}
