import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_package/configs/_config.dart';

import '../../gen/assets.gen.dart';


class AppBackBtn extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SvgPicture.asset(
          Assets.lib.assets.icons.arrowLeft,
          package: 'ui_package',
          height: 24,
          width: 24,
          semanticsLabel: 'Back',
          alignment: Alignment.center,
          theme: SvgTheme(
            currentColor: context.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
