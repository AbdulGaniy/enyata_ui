import 'package:flutter/material.dart';
import 'package:ui_package/categories/atoms/svg_icon.dart';
import 'package:ui_package/configs/_config.dart';


class AppCheck extends StatelessWidget {
  final bool isChecked;
  final double height;
  final double width;

  const AppCheck(
      {super.key, required this.isChecked, this.height = 24, this.width = 24});

  @override
  Widget build(BuildContext context) {
    return AppSvgIcon(
      isChecked ? context.icons.checked : context.icons.unchecked,
      height: height,
      width: width,
    );
  }
}
