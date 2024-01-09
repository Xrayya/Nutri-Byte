import 'package:flutter/material.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

class NutriByteTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: NutriByteColor.seedColor,
          primary: NutriByteColor.light.primary,
          secondary: NutriByteColor.light.secondary,
          tertiary: NutriByteColor.light.tertiary,
          onTertiary: NutriByteColor.light.onTertiary,
          tertiaryContainer: NutriByteColor.light.tertiaryContainer,
          onTertiaryContainer: NutriByteColor.light.onTertiaryContainer,
          brightness: Brightness.light)
      );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: NutriByteColor.seedColor,
          primary: NutriByteColor.dark.primary,
          secondary: NutriByteColor.dark.secondary,
          tertiary: NutriByteColor.dark.tertiary,
          onTertiary: NutriByteColor.dark.onTertiary,
          tertiaryContainer: NutriByteColor.dark.tertiaryContainer,
          onTertiaryContainer: NutriByteColor.dark.onTertiaryContainer,
          brightness: Brightness.dark)
      );
}
