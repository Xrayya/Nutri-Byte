import 'package:flutter/material.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

ThemeData nutriByteTheme() {
  return ThemeData(
    colorSchemeSeed: NutriByteColor.keyColors.primary,
    useMaterial3: true,
  );
}
