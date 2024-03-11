import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ui_package/configs/_config.dart';

//TODO: this switch is not exactly the same as the one in the design
class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  const AppSwitch({Key? key, required this.value, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      borderRadius: 5,
      toggleSize: 10,
      activeColor: context.customColorScheme.checkBox,
      value: value,
      onToggle: onToggle,
    );
  }
}
