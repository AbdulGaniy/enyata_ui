import 'package:flutter/material.dart';

import '../atoms/app_back_button.dart';
import '../atoms/app_text/app_text.dart';
import 'gap.dart';

class AppBarOne extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback onBack;
  final EdgeInsetsGeometry padding;

  const AppBarOne({
    super.key,
    required this.title,
    this.trailing,
    required this.onBack,
    this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 0),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBackBtn(
              onPressed: onBack,
            ),
            Expanded(
              child: Center(
                child: AppText(
                  params: AppTextParams(
                    text: title,
                    textStyle: AppTextStyles.h3,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Visibility(
              child: trailing ?? const Gap(20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
