import 'package:flutter/material.dart';

class GenericBottomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const GenericBottomSheet(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.fromLTRB(0, 32, 0, 50)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: child,
      ),
    );
  }
}
