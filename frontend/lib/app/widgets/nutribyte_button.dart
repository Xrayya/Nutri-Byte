import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

ElevatedButton nutriByteButton({
  required String text,
  VoidCallback? onPressed,
  double? elevation,
  NutriByteButtonType type = NutriByteButtonType.primary,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        elevation: elevation,
        side: BorderSide(
          color: type == NutriByteButtonType.primary
              ? Colors.transparent
              : Get.theme.colorScheme.outline,
          width: 1,
        ),
        disabledBackgroundColor: const Color(0xFF1D1B20).withOpacity(0.1),
        backgroundColor: type == NutriByteButtonType.primary
            ? NutriByteColor.primary70
            : Colors.transparent),
    child: Text(
      text,
      style: Get.textTheme.titleLarge!.copyWith(
        color: onPressed != null
            ? type == NutriByteButtonType.primary
                ? Colors.white
                : Get.theme.colorScheme.primary
            : const Color(0xFF191D16),
      ),
    ),
  );
}

enum NutriByteButtonType { primary, secondary }
