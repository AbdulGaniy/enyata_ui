import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';


import '../../configs/basic_user_display_data.dart';
import '../../configs/constants.dart';
import '../atoms/app_image.dart';
import '../atoms/app_text/app_text.dart';
import '../atoms/display_picture_avatar.dart';
import '../atoms/svg_icon.dart';
import '../layouts/app_inkwell.dart';
import '../layouts/gap.dart';

class ProfileImage extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final bool isEditProfile;
  final VoidCallback? onEditCoverPhotoPressed;
  final VoidCallback? onEditPhotoPressed;
  final BasicUserDisplayData user;
  final Widget? trailing;

  const ProfileImage({
    Key? key,
    required this.user,
    this.onBackPressed,
    this.isEditProfile = false,
    this.onEditCoverPhotoPressed,
    this.onEditPhotoPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            AppInkWell(
              onTap: onEditCoverPhotoPressed,
              child: Container(
                height: UIConstants.profileCoverHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.customColorScheme.cameraBackground,
                ),
                child: Visibility(
                  visible: user.hasCoverPhoto,
                  replacement: AppImage(
                    path: context.images.defaultHeader.path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl: user.coverPhoto,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isEditProfile,
              replacement: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppInkWell(
                      onTap: onBackPressed,
                      child: AppSvgIcon(
                        context.icons.profileBackbutton,
                        width: 34,
                        height: 34,
                      ),
                    ),
                    AppText(
                      params: AppTextParams(
                        text: "Profile",
                        textStyle: AppTextStyles.bodyHeavy,
                        fontSize: 18,
                        color: context.colorScheme.surface,
                      ),
                    ),
                    trailing ?? const SizedBox(),
                  ],
                ),
              ),
              child: AppInkWell(
                onTap: onEditCoverPhotoPressed,
                child: Column(
                  children: [
                    AppSvgIcon(
                      context.icons.camera,
                      width: 24,
                      height: 24,
                    ),
                    const Gap(8),
                    AppText(
                      params: AppTextParams(
                        text: "Edit cover photo",
                        textStyle: AppTextStyles.bodyRegular,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: context.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 15,
          top: UIConstants.profileCoverHeight - 50,
          child: AppInkWell(
            onTap: onEditPhotoPressed,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                AppInkWell(
                  onTap: onEditPhotoPressed,
                  child: DPAvatar(
                    radius: 50,
                    user: user,
                    showBorder: true,
                  ),
                ),
                Visibility(
                    visible: isEditProfile!,
                    child: AppInkWell(
                      onTap: onEditPhotoPressed,
                      child: CircleAvatar(
                        backgroundColor: context.colorScheme.primary,
                        child: AppSvgIcon(context.icons.camera),
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
