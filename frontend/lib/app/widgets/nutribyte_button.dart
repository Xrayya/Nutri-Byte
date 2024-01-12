import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

ElevatedButton nutriByteButton({
  required String text,
  VoidCallback? onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        disabledBackgroundColor: const Color(0xFF1D1B20).withOpacity(0.1),
        backgroundColor: NutriByteColor.primary70),
    child: Text(
      text,
      style: Get.textTheme.titleLarge!.copyWith(
        color: onPressed != null ? Colors.white : const Color(0xFF191D16),
      ),
    ),
  );
}
