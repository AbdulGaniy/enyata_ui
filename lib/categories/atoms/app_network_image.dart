import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const AppNetworkImage({super.key, required this.imageUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => Container(
        color: context.customColorScheme.shimmerHighlightColor,
      ),
    );
  }
}
