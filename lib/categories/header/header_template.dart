import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';
import '../../configs/basic_user_display_data.dart';
import '../atoms/app_text/app_text.dart';
import '../atoms/display_picture_avatar.dart';

class HeaderTemplate extends StatelessWidget {

  /// header title
  final String title;

  final BasicUserDisplayData user;
   const HeaderTemplate({super.key, required this.title, required this.user});
 @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DPAvatar(
          user: user,
          radius: 17,
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: AppText(
                params: AppTextParams(
                  text: title,
                  textStyle: AppTextStyles.bodyRegular,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: context.customColorScheme.displayName,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
