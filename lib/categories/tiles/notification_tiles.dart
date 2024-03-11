import 'package:fast_rich_text/fast_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';


import '../../configs/basic_user_display_data.dart';
import '../atoms/app_text/app_text.dart';
import '../atoms/display_picture_avatar.dart';
import '../layouts/gap.dart';

class NotificationTiles extends StatelessWidget {
  ///time
  final String date;

  ///subscription name
  final String title;

  ///type of notification
  final String type;

  /// user that made an action
  final BasicUserDisplayData user;

  ///time
  final String subtitle;

  const NotificationTiles({
    Key? key,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type.toLowerCase()) {
      case "comment":
        return _buildComment(context);
      case "post_like":
        return _buildWithdrawal(context);
      case "subscription":
        return _buildSubscription(context);
      case "newpost":
        return _buildNewPost(context);
      default:
        return Container();
    }
  }

  Widget _buildComment(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DPAvatar(
            user: user,
          ),
        ),
        title: SizedBox(
          width: 146,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FastRichText(
                text: title,
                textStyle: TextStyle(
                  fontSize: 14,
                  color: context.customColorScheme.textColor.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                ),
                boldSTextStyle: TextStyle(
                  fontSize: 15,
                  color: context.customColorScheme.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap(4),
              AppText(
                params: AppTextParams(
                    text: date,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.customColorScheme.textColor.withOpacity(0.3),
                    textStyle: AppTextStyles.bodyRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithdrawal(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DPAvatar(
            user: user,
          ),
        ),
        title: SizedBox(
          width: 146,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FastRichText(
                text: title,
                textStyle: TextStyle(
                  fontSize: 14,
                  color: context.customColorScheme.textColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
                boldSTextStyle: TextStyle(
                  fontSize: 15,
                  color: context.customColorScheme.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap(4),
              AppText(
                params: AppTextParams(
                    text: date,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.customColorScheme.textColor.withOpacity(0.3),
                    textStyle: AppTextStyles.bodyRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscription(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DPAvatar(
            user: user,
          ),
        ),
        title: SizedBox(
          width: 146,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FastRichText(
                text: title,
                textStyle: TextStyle(
                  fontSize: 14,
                  color: context.customColorScheme.textColor.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                ),
                boldSTextStyle: TextStyle(
                  fontSize: 15,
                  color: context.customColorScheme.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap(4),
              AppText(
                params: AppTextParams(
                    text: date,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Colors.black.withOpacity(0.3),
                    textStyle: AppTextStyles.bodyRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewPost(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DPAvatar(
            user: user,
          ),
        ),
        title: SizedBox(
          width: 146,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FastRichText(
                text: title,
                textStyle: TextStyle(
                  fontSize: 14,
                  color: context.customColorScheme.textColor.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                ),
                boldSTextStyle: TextStyle(
                  fontSize: 15,
                  color: context.customColorScheme.textColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap(4),
              AppText(
                params: AppTextParams(
                    text: date,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.customColorScheme.textColor.withOpacity(0.3),
                    textStyle: AppTextStyles.bodyRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
