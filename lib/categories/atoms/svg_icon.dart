import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String path;
  final double height;
  final double width;
  final Color? color;

  const AppSvgIcon(
    this.path, {
    Key? key,
    this.height = 18,
    this.width = 18,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      package: 'ui_package',
      height: height,
      width: width,
      color: color,

      fit: BoxFit.contain,
    );
  }
}
