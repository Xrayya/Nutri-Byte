import 'package:flutter/material.dart';

class NutriByteColor {
  static const Color seedColor = Color(0xFF65B741);

  static final _LightThemeColors light = _LightThemeColors();
  static final _DarkThemeColors dark = _DarkThemeColors();
  static final Color primary70 = const Color(0xFF6CBF48);
  static final darkText = const Color(0xFF8D8E99);
}

class _LightThemeColors {
  final Color primary = const Color(0xFF446832);
  final Color secondary = const Color(0xFF406836);
  final Color tertiary = const Color(0xFF7E570F);
  final Color onTertiary = const Color(0xFFFFFFFF);
  final Color primaryContainer = const Color(0xFFC4EFAC);
  final Color tertiaryContainer = const Color(0xFFFFDDB0);
  final Color surfaceTint = const Color(0xFF446832);
  final Color onTertiaryContainer = const Color(0xFF291800);
  final Color background = const Color(0xFFF8FAF0);
  final Color outline = const Color(0xFF73796D);
  final Color onPrimaryContainer = const Color(0xFF062100);
}

class _DarkThemeColors {
  final Color primary = const Color(0xFFA9D292);
  final Color secondary = const Color(0xFFA5D396);
  final Color tertiary = const Color(0xFFF2BD6E);
  final Color onTertiary = const Color(0xFF442B00);
  final Color tertiaryContainer = const Color(0xFF614000);
  final Color onTertiaryContainer = const Color(0xFFFFDDB0);
}
