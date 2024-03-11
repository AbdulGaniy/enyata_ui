import "dart:developer" as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '_config.dart';

extension ExThemeBuildContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  CustomColorScheme get customColorScheme {
    if (Theme.of(this).brightness == Brightness.light) {
      return CustomColorScheme.light();
    } else {
      return CustomColorScheme.dark();
    }
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  $LibAssetsIconsGen get icons => Assets.lib.assets.icons;

  $LibAssetsLottieGen get lottie => Assets.lib.assets.lottie;

  $LibAssetsImagesGen get images => Assets.lib.assets.images;
}

extension ExMediaQuery on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;
}

extension ExString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension ExObject on Object {
  void log() {
    if (kDebugMode) {
      // get the caller's name
      final caller = StackTrace.current.toString().split("\n")[1];

      final callerName =
          caller.substring(caller.indexOf(" ") + 1, caller.indexOf("("));
      final className = runtimeType.toString();
      final message = "$callerName: $this";
      dev.log(message, name: className);
    }
  }
}

extension DateTimeEx on DateTime {
  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 0) {
      return "${diff.inDays}d";
    } else if (diff.inHours > 0) {
      return "${diff.inHours}h";
    } else if (diff.inMinutes > 0) {
      return "${diff.inMinutes}m";
    } else {
      return "${diff.inSeconds}s";
    }
  }

  String format({String format = "HH:mm"}) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }
}
