import 'package:flutter/material.dart';

import '../../configs/_config.dart';
import '../atoms/app_text/app_text.dart';
import '../atoms/svg_icon.dart';
import '../layouts/_layouts.dart';

class NameWithVerification extends StatelessWidget {
  final String name;
  final bool isVerified;
  final Color? fontColor;
  final BasicUserDisplayData basicUserDisplayData;

  const NameWithVerification({
    Key? key,
    required this.name,
    required this.isVerified,
    this.fontColor,
    required this.basicUserDisplayData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          params: AppTextParams(
            text: name,
            textStyle: AppTextStyles.bodyRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: fontColor ?? context.customColorScheme.displayName,
          ),
        ),
        const Gap(5),
        Visibility(
          visible: isVerified && basicUserDisplayData.isVerified,
          replacement: const SizedBox.shrink(),
          child: AppSvgIcon(
            context.icons.magicStar,
            width: 14,
            height: 14,
            color: context.customColorScheme.wildCard,
          ),
        )
      ],
    );
  }
}
