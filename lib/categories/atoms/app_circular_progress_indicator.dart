import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';

class AppCircularIndicator extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppCircularIndicator({Key? key, this.size = 30, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color ?? context.colorScheme.onPrimary,
      ),
    );
  }
}
