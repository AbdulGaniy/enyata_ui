import 'package:flutter/material.dart';

class AppColors {
  static final primaryColor = MaterialColor(
    _primaryColorValue,
    _getMaterialColorValues(_primaryColorValue),
  );

  static final secondaryColor = MaterialColor(
    _secondaryColorValue,
    _getMaterialColorValues(_secondaryColorValue),
  );

  static final backgroundColor = MaterialColor(
    _backgroundColorValue,
    _getMaterialColorValues(_backgroundColorValue),
  );

  static final activeColor = MaterialColor(
    _activeColorValue,
    _getMaterialColorValues(_activeColorValue),
  );

  static const textBlack = Color(0xFF0F0D00);

  static const blackColor = Color(0xFF0F0D00);

  static final errorColor = MaterialColor(
    _errorColorValue,
    _getMaterialColorValues(_errorColorValue),
  );

  static final whiteColor = MaterialColor(
    _white,
    _getMaterialColorValues(_white),
  );

  static const gray = MaterialColor(_grayValue, <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF1F5F9),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF0F172A),
  });

  static const _primaryColorValue = 0xFF2E843C;
  static const _secondaryColorValue = 0xFFF3BB36;
  static const _backgroundColorValue = 0xFF04191D;
  static const _activeColorValue = 0xFF3CC13B;
  static const _errorColorValue = 0xFFE30000;
  static const _white = 0xFFFFFFFF;
  static const _grayValue = 0xFF0F172A;

  static const ff011936 = Color(0xFF011936);

  static const ffE2E8F0 = Color(0xFFE2E8F0);

  static const ffF8F8F8 = Color(0xFFF8F8F8);

  static const ff0F0A00 = Color(0xFF0F0A00);

  static Map<int, Color> _getMaterialColorValues(int colorValue) {
    return [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        .map(
          (e) => {
            e: Color(colorValue).withOpacity(e / 100),
          },
        )
        .reduce((value, element) => {...value, ...element});
  }

  static const americanGreen = Color(0xFF3CC13B);

  static const ffB9B9BB = Color(0xFFB9B9BB);

  static const ff0E0E0E = Color(0xFF0E0E0E);

  static const fff8f4f0 = Color(0xFFF8F4F0);

  static const f14100A27 = Color(0x14100A27);

  static const f94A3B8 = Color(0xFF94A3B8);
}
