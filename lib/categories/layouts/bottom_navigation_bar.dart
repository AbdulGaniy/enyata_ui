import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/categories/atoms/_atoms.dart';
import 'package:ui_package/configs/_config.dart';

import '../atoms/svg_icon.dart';
class AppBottomNavBar extends StatelessWidget {
  /// The current index of the selected item.
  final ValueNotifier<int> currentIndexNotifier;

  /// The callback that is called when an item is tapped.
  final OnTapBottomNavigationBar onTap;

  /// The list of items to display in the bottom navigation bar.
  final List<BottomNavBarItem> navbarItems;

  const AppBottomNavBar({
    Key? key,
    required this.currentIndexNotifier,
    required this.onTap,
    required this.navbarItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Container(
          padding: defaultTargetPlatform == TargetPlatform.iOS
              ? const EdgeInsets.only(top: 20)
              : null,
          height: defaultTargetPlatform == TargetPlatform.iOS
              ? kBottomNavigationBarHeight + 40
              : kBottomNavigationBarHeight,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 8.0,
                color: const Color(0xFF646464).withOpacity(0.2)),
          ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navbarItems
                  .asMap()
                  .map(
                    (index, item) => MapEntry(
                      index,
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        onTap: () => onTap(index),
                        child: _NavBarItemWidget(
                          index: index,
                          item: item,
                          isCurrentIndex: currentIndex == index,
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList()),
        );
      },
    );
  }
}

typedef OnTapBottomNavigationBar = void Function(int);

class BottomNavBarItem {
  final String title;
  final String activeIconPath;
  final String inactiveIconPath;
  final ValueNotifier<int>? overlayCountNotifier;

  const BottomNavBarItem({
    required this.title,
    required this.activeIconPath,
    required this.inactiveIconPath,
    this.overlayCountNotifier,
  });
}

class _NavBarItemWidget extends StatelessWidget {
  final int index;
  final BottomNavBarItem item;
  final bool isCurrentIndex;

  const _NavBarItemWidget({
    Key? key,
    required this.index,
    required this.item,
    required this.isCurrentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: item.overlayCountNotifier ?? ValueNotifier(0),
              builder: (context, value, child) {
                return Visibility(
                  visible: value > 0,
                  child: Positioned(
                    top: 0,
                    right: -5,
                    child: Container(
                      height: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: context.colorScheme.onPrimary,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          value.toString() ?? '',
                          style: TextStyle(
                            color: context.colorScheme.onPrimary,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          Column(
            children: [
              AppSvgIcon(
                isCurrentIndex ? item.activeIconPath : item.inactiveIconPath,
                height: 24,
                width: 24,
                color: isCurrentIndex
                    ? context.customColorScheme.primary
                    : context.customColorScheme.bottomNavColor
              ),
              AppText(
                  params: AppTextParams(
                    text: item.title,
                    textStyle: AppTextStyles.bodyRegular,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: isCurrentIndex
                        ? context.customColorScheme.primary
                        : context.customColorScheme.bottomNavColor,
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}
