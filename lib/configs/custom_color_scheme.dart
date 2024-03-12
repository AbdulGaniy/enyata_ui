import 'package:flutter/material.dart';

import 'colors.dart';

class CustomColorScheme {
  final Color icon;
  final Color primary;
  final Color recommendedFollowCardShadow;
  final Color displayName;
  final Color drawerSectionDivider;
  final Color textColor;
  final Color feedEmpty;
  final Color checkBox;
  final Color cameraBackground;
  final Color settingsDivider;
  final Color unreadMessages;
  final Color walletColorOne;
  final Color walletColorTwo;
  final Color dividerColor;
  final Color lightTextColor;
  final Color uploadProgressBackground;
  final Color homePageBackgroundColor;
  final Color darkBlue;
  final Color tagText;
  final Color bodyGrey;
  final Color loaderColor;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Color readMoreText;
  final Color textFieldBorderColor;
  final Color postCommentTextFieldBackground;
  final Color shadow;
  final Color lightWarningBackground;
  final Color successOverlayBackground;
  final Color errorOverlayBackground;
  final Color errorOverlayBorder;
  final Color pinNumberColor;
  final Color firstPulserColor;
  final Color secondPulserColor;
  final Color secondary;
  final Color infoColor;
  final Color lockedContainerBackground;
  final Color tagColor;
  final Color postCategoryColor;
  final Color deleteButton;
  final Color subscriberTag;
  final Color subscriberTagText;
  final Color comingSoonColor;
  final Color gray400;
  final Color error;
  final Color activeGreen;
  final Color wildCard;
  final Color bottomNavColor;
  final Color splashScreenBackground;
  CustomColorScheme._({
    required this.primary,
    required this.icon,
    required this.recommendedFollowCardShadow,
    required this.displayName,
    required this.drawerSectionDivider,
    required this.textColor,
    required this.feedEmpty,
    required this.checkBox,
    required this.cameraBackground,
    required this.settingsDivider,
    required this.walletColorOne,
    required this.walletColorTwo,
    required this.unreadMessages,
    required this.dividerColor,
    required this.lightTextColor,
    required this.uploadProgressBackground,
    required this.homePageBackgroundColor,
    required this.darkBlue,
    required this.tagText,
    required this.bodyGrey,
    required this.loaderColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.readMoreText,
    required this.textFieldBorderColor,
    required this.postCommentTextFieldBackground,
    required this.shadow,
    required this.lightWarningBackground,
    required this.successOverlayBackground,
    required this.errorOverlayBackground,
    required this.pinNumberColor,
    required this.errorOverlayBorder,
    required this.firstPulserColor,
    required this.secondPulserColor,
    required this.secondary,
    required this.infoColor,
    required this.lockedContainerBackground,
    required this.tagColor,
    required this.postCategoryColor,
    required this.deleteButton,
    required this.subscriberTag,
    required this.subscriberTagText,
    required this.comingSoonColor,
    required this.gray400,
    required this.error,
    required this.activeGreen,
    required this.wildCard,
    required this.bottomNavColor,
    required this.splashScreenBackground,
  });

  factory CustomColorScheme.light() => CustomColorScheme._(
        icon: Colors.black,
        recommendedFollowCardShadow: const Color(0xFF9C9C9C),
        displayName: const Color(0xFF3D3531),

        drawerSectionDivider: const Color(0xFFF7F7F7),
        textColor: const Color(0xFF16171D),
        feedEmpty: const Color(0xFFCBD5E1),
        checkBox: AppColors.americanGreen,
        cameraBackground: const Color(0XFF64748B),
        settingsDivider: const Color(0xFFEBEDF0),
        unreadMessages: AppColors.ffB9B9BB,
        dividerColor: AppColors.ff0E0E0E,
        lightTextColor: AppColors.ff011936,
        uploadProgressBackground: AppColors.ffE2E8F0,
        walletColorOne: const Color(0xFF197BBD),
        walletColorTwo: const Color(0xFF3391D0),
        homePageBackgroundColor: const Color(0xFFF9FAFC),
        darkBlue: const Color(0xFF011936),
        tagText: const Color(0xFF3D3531),
        bodyGrey: const Color(0xFF0F172A),
        loaderColor: const Color(0xFFE6E6E6),
        shimmerBaseColor: Colors.grey[400]!,
        shimmerHighlightColor: Colors.grey[100]!,
        readMoreText: const Color(0xFF64748B),
        textFieldBorderColor: AppColors.ff0F0A00,
        postCommentTextFieldBackground: AppColors.ffF8F8F8,
        shadow: AppColors.f14100A27,
        lightWarningBackground: const Color(0xffFFF8EC),
        successOverlayBackground: const Color(0xffF6FFF9),
        errorOverlayBackground: const Color(0xffFFF5F3),
        errorOverlayBorder: const Color(0xffF4B0A1),
        pinNumberColor: const Color(0xff0F161E),
        firstPulserColor: const Color(0xffB742631A),
        secondPulserColor: const Color(0xFF0A47511A),
        secondary: AppColors.secondaryColor,
        infoColor: const Color(0xFF0A47510D),
        primary: const Color(0xFF2E843C),
        lockedContainerBackground: const Color(0xFF334155),
        tagColor: const Color(0xFFF3BB36),
        postCategoryColor: const Color(0xFFF8D686),
        deleteButton: const Color(0XFFE30000),
        subscriberTag: const Color(0xFFCAD4E0),
        subscriberTagText: const Color(0xFF475569),
        comingSoonColor: const Color(0xFF90D147),
        gray400: AppColors.f94A3B8,
        activeGreen: const Color(0xFF3CC13B),
        wildCard: const Color(0xFF034752),
        error: AppColors.errorColor,
    bottomNavColor: const Color(0xFF6D6D6D),
    splashScreenBackground: const Color(0xFF13293D),
      );

  // in case you want to use dark theme
  factory CustomColorScheme.dark() => CustomColorScheme._(
        icon: Colors.white,
        recommendedFollowCardShadow: const Color(0xFF9C9C9C),
        displayName: const Color(0xFF3D3531),
        drawerSectionDivider: const Color(0xFFF7F7F7),
        textColor: const Color(0xFF16171D),
        feedEmpty: const Color(0xFFCBD5E1),
        checkBox: AppColors.americanGreen,
        cameraBackground: const Color(0XFF64748B),
        settingsDivider: const Color(0xFFEBEDF0),
        unreadMessages: const Color(0xFFE5F1FF),
        dividerColor: const Color(0xFFEBEDF0),
        primary: const Color(0xFF2E843C),
        lightTextColor: const Color(0xFF011936),
        uploadProgressBackground: const Color(0xFFE2E8F0),
        walletColorOne: const Color(0xFF197BBD),
        walletColorTwo: const Color(0xFF3391D0),
      homePageBackgroundColor: const Color(0xFFF9FAFC),
        darkBlue: const Color(0xFF011936),
        tagText: const Color(0xFF3D3531),
        bodyGrey: const Color(0xFF0F172A),
        loaderColor: const Color(0xFFE6E6E6),
        shimmerBaseColor: Colors.grey[400]!,
        shimmerHighlightColor: Colors.grey[100]!,
        readMoreText: const Color(0xFF64748B),
        textFieldBorderColor: AppColors.ff0F0A00,
        postCommentTextFieldBackground: AppColors.ffF8F8F8,
        shadow: AppColors.f14100A27,
        lightWarningBackground: const Color(0xff979FA9),
        successOverlayBackground: const Color(0xffF6FFF9),
        errorOverlayBackground: const Color(0xffFFF5F3),
        errorOverlayBorder: const Color(0xffF4B0A1),
        pinNumberColor: const Color(0xff0F161E),
        firstPulserColor: const Color(0xffB742631A),
        secondPulserColor: const Color(0xFF0A47511A),
        secondary: AppColors.secondaryColor,
        infoColor: const Color(0xFF0A47510D),
        lockedContainerBackground: const Color(0xFF334155),
        tagColor: const Color(0xFFF3BB36),
        postCategoryColor: const Color(0xFFF8D686),
        deleteButton: const Color(0XFFE30000),
        subscriberTag: const Color(0xFFCAD4E0),
        subscriberTagText: const Color(0xFF475569),
        comingSoonColor: const Color(0xFF90D147),
        gray400: AppColors.f94A3B8,
        error: AppColors.errorColor,
        activeGreen: const Color(0xFF3CC13B),
        wildCard: const Color(0xFF034752),
      bottomNavColor: const Color(0xFF6D6D6D),
    splashScreenBackground: const Color(0xFF13293D),
      );
}
