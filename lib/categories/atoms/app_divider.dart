import 'package:flutter/material.dart';
import 'package:ui_package/configs/extensions.dart';

class AppDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color? color;
  final double? width;

  const AppDivider({
    Key? key,
    this.height = 1,
    this.thickness = 1,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Divider(
        height: height,
        thickness: thickness,
        color:
            color ?? context.customColorScheme.settingsDivider.withOpacity(0.05),
      ),
    );
  }
}
