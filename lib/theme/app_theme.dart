import 'package:flutter/material.dart';

/// 静奢黑（Quiet Dark）设计 token
/// 背景近黑，文字暖白，朱砂只做「状态色」，全屏封面承担情绪。
class AppColors {
  static bool _isDark = true;

  static void setDark(bool value) => _isDark = value;
  static bool get isDark => _isDark;

  // Theme-dependent colors
  static Color get background =>
      _isDark ? const Color(0xFF08080A) : const Color(0xFFF4F0E7);
  static Color get card =>
      _isDark ? const Color(0xFF121214) : const Color(0xFFFBF8F1);
  static Color get cardSecondary =>
      _isDark ? const Color(0xFF1A1A1D) : const Color(0xFFECE6D8);
  static Color get foreground =>
      _isDark ? const Color(0xFFF2F2F4) : const Color(0xFF12100C);
  static Color get border =>
      _isDark ? const Color(0xFF232327) : const Color(0xFFE2DACB);

  // Theme-independent colors
  static const primary = Color(0xFFC4462F);
  static const mutedForeground = Color(0xFF8A8A8F);
}

class AppTheme {
  static const String _font = 'SF Pro Display';

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF08080A),
        canvasColor: const Color(0xFF08080A),
        dividerColor: const Color(0xFF232327),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: Color(0xFF121214),
          onSurface: Color(0xFFF2F2F4),
        ),
        fontFamily: _font,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFF2F2F4),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
          iconTheme: IconThemeData(color: Color(0xFFF2F2F4), size: 22),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF1A1A1D),
          contentTextStyle: TextStyle(color: Color(0xFFF2F2F4), fontSize: 13),
          behavior: SnackBarBehavior.floating,
        ),
      );

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF4F0E7),
        canvasColor: const Color(0xFFF4F0E7),
        dividerColor: const Color(0xFFE2DACB),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          surface: Color(0xFFFBF8F1),
          onSurface: Color(0xFF12100C),
        ),
        fontFamily: _font,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF12100C),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.6,
          ),
          iconTheme: IconThemeData(color: Color(0xFF12100C), size: 22),
        ),
      );
}
