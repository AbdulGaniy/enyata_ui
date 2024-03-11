import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';

import '../atoms/app_circular_progress_indicator.dart';


part 'app_button_params.dart';

class AppButton extends StatelessWidget {
  final AppButtonParams params;

  const AppButton({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: params.isFullWidth ? double.infinity : params.width,
      height: params.height,
      child: params.isOutline
          ? _OutlineButton(params: params)
          : _FilledButton(params: params),
    );
  }
}

class _FilledButton extends StatelessWidget {
  final AppButtonParams params;

  const _FilledButton({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: params.isDisabled
          ? null
          : params.isLoading
              ? () {}
              : params.onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(params.radius),
        ),
        backgroundColor: params.backgroundColor ?? context.customColorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        disabledBackgroundColor: context.customColorScheme.primary.withOpacity(0.1),
        disabledForegroundColor: context.customColorScheme.primary.withOpacity(0.4),
        padding: params.padding,
        textStyle: context.textTheme.bodyMedium,
      ),
      child: params.isLoading
          ? const AppCircularIndicator()
          : params.child ??
              Text(
                params.text ?? '',
                style: params.textStyle ?? TextStyle(color: params.textColor),
              ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final AppButtonParams params;

  const _OutlineButton({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: params.isDisabled
          ? null
          : params.isLoading
              ? () {}
              : params.onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(params.radius),
        ),
        side: BorderSide(
          color: params.outlineColor ?? context.colorScheme.onPrimary,
          width: 1,
        ),
        padding: params.padding,
        foregroundColor: context.colorScheme.onPrimary,
        textStyle: context.textTheme.bodyMedium,
      ),
      child: params.isLoading
          ? const AppCircularIndicator()
          : params.child ??
              Text(
                params.text ?? '',
                style: params.textStyle ?? TextStyle(color: params.textColor),
              ),
    );
  }
}
