import 'package:flutter/material.dart';

import '../atoms/app_back_button.dart';
import '../atoms/app_divider.dart';
import '../atoms/app_text/app_text.dart';
import 'gap.dart';

class AppLayoutTwo extends StatelessWidget {
  final LayoutTwoParams params;

  const AppLayoutTwo({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _LayoutHeader(params: params),
            Expanded(
              child: params.child ??
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: params.children ?? [],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutTwoParams {
  final String title;
  final FontWeight titleWeight;
  final AppTextStyles titleStyle;
  final List<Widget>? children;
  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final Widget? fixedHeader;
  final bool showBackButton;
  final bool showDivider;

  LayoutTwoParams({
    required this.title,
    this.children,
    this.child,
    this.leading,
    this.trailing,
    this.showBackButton = true,
    this.fixedHeader,
    this.titleWeight = FontWeight.w700,
    this.titleStyle = AppTextStyles.h6,
    this.showDivider = false,
  });
}

class _LayoutHeader extends StatelessWidget {
  final LayoutTwoParams params;

  const _LayoutHeader({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLeading(context),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: AppText(
                    params: AppTextParams(
                      text: params.title,
                      textAlign: TextAlign.center,
                      textStyle: params.titleStyle,
                      fontWeight: params.titleWeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: params.trailing ?? const SizedBox(),
                ),
              ),
            ],
          ),
          if (params.fixedHeader != null) ...[
            const Gap(20),
            params.fixedHeader!,
          ],
          if (params.fixedHeader == null) const Gap(20),
          if (params.showDivider) ...[
            const Gap(20),
            const AppDivider(),
          ]
        ],
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    if (params.showBackButton) {
      return AppBackBtn(onPressed: () => Navigator.of(context).pop());
    } else {
      return params.leading ?? const SizedBox();
    }
  }
}
