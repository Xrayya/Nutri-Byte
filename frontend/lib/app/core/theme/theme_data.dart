import 'package:flutter/material.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

class NutriByteTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Signika",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 57, fontFamily: 'Signika', fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: 'Signika',
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
        letterSpacing: 0.1,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        fontFamily: 'Signika',
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Signika',
        letterSpacing: 0.4,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: NutriByteColor.seedColor,
        primary: NutriByteColor.light.primary,
        secondary: NutriByteColor.light.secondary,
        tertiary: NutriByteColor.light.tertiary,
        primaryContainer: NutriByteColor.light.primaryContainer,
        background: NutriByteColor.light.background,
        surfaceTint: NutriByteColor.light.surfaceTint,
        onTertiary: NutriByteColor.light.onTertiary,
        tertiaryContainer: NutriByteColor.light.tertiaryContainer,
        onTertiaryContainer: NutriByteColor.light.onTertiaryContainer,
        outline: NutriByteColor.light.outline,
        brightness: Brightness.light),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      alignLabelWithHint: true,
      focusColor: NutriByteColor.light.primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: NutriByteColor.light.outline, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: NutriByteColor.light.primary, width: 3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red, width: 3),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Signika',
            letterSpacing: 0.5,
          ),
        ),
        foregroundColor:
            MaterialStateProperty.all(NutriByteColor.light.primary),
        overlayColor: MaterialStateProperty.all(NutriByteColor.seedColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(NutriByteColor.primary70),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Signika",
      colorScheme: ColorScheme.fromSeed(
          seedColor: NutriByteColor.seedColor,
          primary: NutriByteColor.dark.primary,
          secondary: NutriByteColor.dark.secondary,
          tertiary: NutriByteColor.dark.tertiary,
          onTertiary: NutriByteColor.dark.onTertiary,
          tertiaryContainer: NutriByteColor.dark.tertiaryContainer,
          onTertiaryContainer: NutriByteColor.dark.onTertiaryContainer,
          brightness: Brightness.dark));
}
