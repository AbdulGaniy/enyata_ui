// DP = Display Picture
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/categories/atoms/_atoms.dart';
import 'package:ui_package/categories/atoms/svg_icon.dart';
import 'package:ui_package/configs/_config.dart';

import '../../configs/basic_user_display_data.dart';

class DPAvatar extends StatelessWidget {
  final bool showBorder;
  final BasicUserDisplayData user;
  final String? firstName;
  final String? lastName;
  final double radius;

  const DPAvatar({
    Key? key,
    this.showBorder = false,
    this.radius = 17.5,
    required this.user,
    this.firstName = "",
    this.lastName = " ",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7B61FF),
            Color(0XFFE23A4D),
          ],
        ),
        color: context.colorScheme.primary,
        border: showBorder
            ? Border.all(
                color: context.colorScheme.outline,
                width: 2,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: AppText(
        params:AppTextParams(
            text: "$firstName![0] $lastName![0]".toUpperCase().trim(),
          fontSize: 24,
          fontWeight: FontWeight.w400,
          textStyle: AppTextStyles.bodyRegular
        )
      )
    );
  }
}
