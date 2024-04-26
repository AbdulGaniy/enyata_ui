// import 'package:flutter/material.dart';
// import 'package:ui_package/configs/_config.dart';
// import '../atoms/app_back_button.dart';
// import '../atoms/app_text/app_text.dart';
// import '../atoms/logo.dart';
// import 'gap.dart';
//
// class AppLayoutOne extends StatelessWidget {
//   /// Params for rendering the [AppLayoutOne] widget.
//   final LayoutOneParams params;
//
//   const AppLayoutOne({Key? key, required this.params}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: context.screenWidth,
//           height: context.screenHeight,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: params.crossAxisAlignment,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _LayoutOneHeader(params: params),
//                 Expanded(
//                   child: params.isScrollable
//                       ? SingleChildScrollView(
//                           physics: params.scrollPhysics,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: params.crossAxisAlignment,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: params.children,
//                           ),
//                         )
//                       : Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: params.crossAxisAlignment,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: params.children,
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _LayoutOneHeader extends StatelessWidget {
//   final LayoutOneParams params;
//
//   const _LayoutOneHeader({Key? key, required this.params}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 30, bottom: 32),
//       child: Column(
//         crossAxisAlignment: params.crossAxisAlignment,
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Visibility(
//             visible: params.showBackButton,
//             replacement: const SizedBox.shrink(),
//             child: AppBackBtn(onPressed: params.onBackButtonPressed),
//           ),
//           Visibility(
//             visible: params.showLogo,
//             replacement: const SizedBox.shrink(),
//             child: const AppLogo(),
//           ),
//           const Gap(30),
//           AppText(
//             params: AppTextParams(
//               text: params.title,
//               textStyle: AppTextStyles.h5,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Gap(16),
//           AppText(
//             params: AppTextParams(
//               text: params.subtitle,
//               textStyle: AppTextStyles.bodyRegular,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// [LayoutOneParams] is a class that contains all the parameters that are
// /// required to build the [AppLayoutOne] widget.
// class LayoutOneParams {
//   /// The title text
//   final String title;
//
//   /// The subtitle text
//   final String subtitle;
//
//   /// Whether to show the logo or not
//   final bool showLogo;
//
//   /// Whether the content is scrollable or not
//   final bool isScrollable;
//
//   /// Whether to show the back button or not
//   final bool showBackButton;
//
//   /// The list of widgets that are displayed in the content
//   final List<Widget> children;
//
//   final VoidCallback? onBackButtonPressed;
//
//   final CrossAxisAlignment crossAxisAlignment;
//
//   final ScrollPhysics scrollPhysics;
//
//   const LayoutOneParams({
//     required this.title,
//     required this.subtitle,
//     this.showLogo = false,
//     this.isScrollable = false,
//     this.showBackButton = true,
//     this.onBackButtonPressed,
//     required this.children,
//     this.crossAxisAlignment = CrossAxisAlignment.start,
//     this.scrollPhysics = const BouncingScrollPhysics(),
//   });
//
//   LayoutOneParams copyWith({
//     String? title,
//     String? subtitle,
//     bool? showLogo,
//     bool? isScrollable,
//     bool? showBackButton,
//     VoidCallback? onBackButtonPressed,
//     List<Widget>? children,
//     CrossAxisAlignment? crossAxisAlignment,
//     ScrollPhysics? scrollPhysics,
//   }) {
//     return LayoutOneParams(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       showLogo: showLogo ?? this.showLogo,
//       isScrollable: isScrollable ?? this.isScrollable,
//       showBackButton: showBackButton ?? this.showBackButton,
//       onBackButtonPressed: onBackButtonPressed ?? this.onBackButtonPressed,
//       children: children ?? this.children,
//       crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
//       scrollPhysics: scrollPhysics ?? this.scrollPhysics,
//     );
//   }
// }
