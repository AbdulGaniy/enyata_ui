import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';

import '../atoms/app_text/app_text.dart';
import '../buttons/app_button.dart';
import '../layouts/gap.dart';

class WalletCard extends StatelessWidget {
  ///amount
  final String amount;

  ///add card button
  final VoidCallback onAddFundsPressed;

  ///Deposit button
  final VoidCallback onWithdrawPressed;

  ///check if user is a creator
  final bool isCreator;

  const WalletCard({
    Key? key,
    required this.amount,
    required this.onAddFundsPressed,
    required this.onWithdrawPressed,
    required this.isCreator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: context.colorScheme.primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                params: AppTextParams(
                    text: "Wallet Balance",
                    textStyle: AppTextStyles.bodyRegular,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.surface,
                    fontSize: 16),
              ),
              const Gap(8),
              AppText(
                params: AppTextParams(
                  text: amount,
                  textStyle: AppTextStyles.bodyRegular,
                  fontSize: 30,
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(32),
              Visibility(
                visible: isCreator,
                replacement: AppButton(
                  params: AppButtonParams(
                    isFullWidth: true,
                    width: 143,
                    text: "Add Funds",
                    backgroundColor: context.colorScheme.surface,
                    textColor: context.colorScheme.primary,
                    onPressed: onAddFundsPressed,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        params: AppButtonParams(
                          isFullWidth: false,
                          text: "Add Funds",
                          backgroundColor: context.colorScheme.surface,
                          textColor: context.colorScheme.primary,
                          onPressed: onAddFundsPressed,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: AppButton(
                        params: AppButtonParams(
                          isFullWidth: false,
                          text: "Cash out",
                          isOutline: true,
                          textColor: context.colorScheme.surface,
                          onPressed: onWithdrawPressed,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // AppSvgIcon(
        //   context.icons.cardVector,
        //   width: 178,
        //   height: 102,
        // )
      ],
    );
  }
}
