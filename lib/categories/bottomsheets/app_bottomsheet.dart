import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';


import '../atoms/app_text/app_text.dart';
import '../atoms/svg_icon.dart';
import '../buttons/app_button.dart';
import '../layouts/gap.dart';
import 'generic_bottomsheet.dart';

class _AppBottomSheetOne extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback onPressed;
  final VoidCallback? onCancel;
  final Size iconSize;

  const _AppBottomSheetOne({
    Key? key,
    required this.iconPath,
    required this.title,
    this.subtitle,
    this.buttonText,
    required this.onPressed,
    this.onCancel,
    this.iconSize = const Size(90, 90),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          params: AppTextParams(
            text: title,
            textStyle: AppTextStyles.h6,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(30),
        AppSvgIcon(
          iconPath,
          width: iconSize.width,
          height: iconSize.height,
        ),
        Visibility(
          visible: subtitle != null && (subtitle ?? '').isNotEmpty,
          replacement: const SizedBox.shrink(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(30),
              AppText(
                params: AppTextParams(
                  text: subtitle ?? '',
                  textStyle: AppTextStyles.bodyRegular,
                  maxLines: 3,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  color: context.colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        const Gap(50),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: AppButton(
            params: AppButtonParams(
              text: buttonText ?? 'Done',
              onPressed: onPressed,
              isFullWidth: true,
            ),
          ),
        ),
      ],
    ));
  }
}

Future<T?> showAppBottomSheetOne<T>(
  BuildContext context, {
  required String iconPath,
  required String title,
  String? subtitle,
  String? buttonText,
  VoidCallback? onCancel,
  required VoidCallback onPressed,
  Size iconSize = const Size(90, 90),
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: _AppBottomSheetOne(
          iconPath: iconPath,
          title: title,
          subtitle: subtitle,
          onCancel: onCancel,
          buttonText: buttonText,
          iconSize: iconSize,
          onPressed: onPressed,
        ),
      );
    },
  );
}
