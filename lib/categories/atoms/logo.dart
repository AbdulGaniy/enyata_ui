import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_package/configs/_config.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;

  const AppLogo({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.icons.srexLogo,
      package: 'ui_package',
      semanticsLabel: 'App Logo',
      alignment: Alignment.center,
      height: height,
      width: width,
      theme: SvgTheme(
        currentColor: context.colorScheme.primary,
      ),
    );
  }
}
