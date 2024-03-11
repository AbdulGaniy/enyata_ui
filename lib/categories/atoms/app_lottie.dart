import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottieSource { asset, file, network }

class AppLottie extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final LottieSource source;

  const AppLottie(
    this.path, {
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.source = LottieSource.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (source) {
      case LottieSource.asset:
        return Lottie.asset(
          path,
          package: 'ui_package',
          height: height,
          width: width,
          fit: fit,
        );
      case LottieSource.file:
        return Lottie.file(
          File(path),
          height: height,
          width: width,
          fit: fit,
        );
      case LottieSource.network:
        return Lottie.network(
          path,
          height: height,
          width: width,
          fit: fit,
        );
    }
  }
}
