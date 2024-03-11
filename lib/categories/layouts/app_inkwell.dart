import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const AppInkWell({Key? key, required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: child,
    );
  }
}
