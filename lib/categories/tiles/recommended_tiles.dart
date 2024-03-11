import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';
import '../atoms/app_text/app_text.dart';
import '../layouts/app_inkwell.dart';

class RecommendedTiles extends StatelessWidget {
  /// the title
  final String title;

  /// the icons

  ///when icon is pressed
  final VoidCallback onpressed;

  ///show trailing button
  final bool showForwardButton;

  const RecommendedTiles(
      {Key? key,
      required this.title,
      required this.onpressed,
      required this.showForwardButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onpressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: context.customColorScheme.settingsDivider))),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              child: AppText(
                params: AppTextParams(
                  text: title,
                  textStyle: AppTextStyles.bodyRegular,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 15,
              height: 24,
              child: Icon(
                Icons.chevron_right,
                color: context.customColorScheme.textColor.withOpacity(0.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
