import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:ui_package/configs/_config.dart';

import '../atoms/app_divider.dart';
import '../atoms/app_text/app_text.dart';
import '../atoms/display_picture_avatar.dart';
import '../atoms/svg_icon.dart';
import '../composites/name_with_verification.dart';
import 'app_inkwell.dart';
import 'gap.dart';

class DrawerItem extends Equatable {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const DrawerItem({
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  List<Object?> get props => [title, iconPath];
}

class AppDrawerLayout extends StatelessWidget {
  final List<DrawerItem> items;
  final DrawerItem? currentItem;
  final Widget drawerHeader;

  const AppDrawerLayout({
    Key? key,
    this.items = const [],
    this.currentItem,
    required this.drawerHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .8,
      height: context.screenHeight * 1,
      constraints: BoxConstraints(
        maxWidth: context.screenWidth * .8,
      ),
      child: Drawer(
        clipBehavior: Clip.hardEdge,
        width: context.screenWidth * .8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            drawerHeader,
            const _SectionDivider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: items
                        .map(
                          (e) => _DrawerItemDisplay(
                            key: ValueKey(e.title),
                            item: e,
                            isCurrent: e == currentItem,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: PromotionContainer(),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

class _DrawerItemDisplay extends StatelessWidget {
  final DrawerItem item;
  final bool isCurrent;

  const _DrawerItemDisplay({
    Key? key,
    required this.item,
    this.isCurrent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: AppInkWell(
        onTap: item.onTap,
        child: Row(
          children: [
            AppSvgIcon(
              height: 21,
              item.iconPath,
              color: isCurrent
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface,
            ),
            const Gap(14),
            Expanded(
              child: AppText(
                params: AppTextParams(
                  text: item.title,
                  textStyle: AppTextStyles.bodyRegular,
                  fontSize: 16,
                  fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w500,
                  color: isCurrent
                      ? context.colorScheme.primary
                      : context.customColorScheme.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDivider(
          color: context.colorScheme.onSurface.withOpacity(.1),
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: context.customColorScheme.drawerSectionDivider,
        ),
      ],
    );
  }
}

class DrawerHeader extends StatelessWidget {
  final BasicUserDisplayData user;
  final int subscriptionsCount;
  final bool isCreator;
  final int subscribersCount;
  final VoidCallback? onSubscriberPressed;
  final VoidCallback? onSubscriptionPressed;

  const DrawerHeader({
    Key? key,
    required this.user,
    required this.subscriptionsCount,
    required this.isCreator,
    required this.subscribersCount,
    required this.onSubscriberPressed,
    required this.onSubscriptionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 55, 30, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DPAvatar(
            radius: 25,
            user: user,
          ),
          const Gap(16),
          Row(
            children: [
              NameWithVerification(
                name: user.displayName.toTitleCase ?? '',
                isVerified: user.isVerified,
                basicUserDisplayData: user,
              ),
              const Gap(14),
              isCreator ? const BuildCreatorTag() : const BuildSubscriberTag()
            ],
          ),
          const Gap(2),
          AppText(
            params: AppTextParams(
              text: '@${user.username}',
              textStyle: AppTextStyles.bodyVerySmall,
              color: context.colorScheme.onSurface.withOpacity(.7),
            ),
          ),
          const Gap(10),
          Row(
            children: [
              AppInkWell(
                onTap: onSubscriptionPressed,
                child: Row(
                  children: [
                    AppText(
                      params: AppTextParams(
                        text: '$subscriptionsCount',
                        textStyle: AppTextStyles.bodyMedium,
                        fontSize: 15,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const Gap(4),
                    AppText(
                      params: AppTextParams(
                        text: 'Subscriptions',
                        textStyle: AppTextStyles.bodyRegular,
                        fontSize: 16,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              AppInkWell(
                onTap: isCreator ? onSubscriberPressed : null,
                child: Row(
                  children: [
                    AppText(
                      params: AppTextParams(
                        text: '$subscribersCount',
                        textStyle: AppTextStyles.bodyMedium,
                        fontSize: 15,
                        color: isCreator
                            ? context.colorScheme.onSurface
                            : context.customColorScheme.bodyGrey
                                .withOpacity(0.6),
                      ),
                    ),
                    const Gap(4),
                    AppText(
                      params: AppTextParams(
                        text: 'Subscribers',
                        textStyle: AppTextStyles.bodyRegular,
                        fontSize: 16,
                        color: isCreator
                            ? context.colorScheme.onSurface
                            : context.customColorScheme.bodyGrey
                                .withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildCreatorTag extends StatelessWidget {
  const BuildCreatorTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 9, bottom: 9),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: context.customColorScheme.tagColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            color: context.customColorScheme.tagColor,
            size: 13,
          ),
          const Gap(4),
          AppText(
            params: AppTextParams(
              text: 'Creator',
              textStyle: AppTextStyles.bodyRegular,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: context.customColorScheme.tagColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSubscriberTag extends StatelessWidget {
  const BuildSubscriberTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: context.customColorScheme.subscriberTag,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSvgIcon(
            context.icons.crown,
            height: 10,
          ),
          const Gap(4),
          AppText(
            params: AppTextParams(
              text: 'Subscriber',
              textStyle: AppTextStyles.bodyRegular,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: context.customColorScheme.subscriberTagText,
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionContainer extends StatelessWidget {
  const PromotionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: context.customColorScheme.bodyGrey,
      ),
      child: AppText(
        params: AppTextParams(
          text: "Share exclusive content and earn from subscriptions. ✨.",
          textStyle: AppTextStyles.bodyRegular,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: context.colorScheme.surface,
        ),
      ),
    );
  }
}
