import 'dart:io';

import 'package:flutter/material.dart';


class AppImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final bool isLocal;

  const AppImage({
    Key? key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.isLocal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLocal) {
      return Image.file(
        File(path),
        height: height,
        width: width,
        color: color,
        fit: fit,
      );
    }


    return Image.asset(
      path,
      package: 'ui_package',
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
}
