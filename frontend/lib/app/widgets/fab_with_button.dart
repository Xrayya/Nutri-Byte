import 'package:flutter/material.dart';
import 'package:get/get.dart';

IntrinsicHeight FABWithLabel({
  Function()? onPress,
  required String label,
  required Widget child,
}) {
  return IntrinsicHeight(
    child: Column(
      children: [
        FloatingActionButton.small(
          heroTag: UniqueKey().toString(),
          onPressed: onPress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
        Text(
          label,
          style: Get.textTheme.bodySmall!.copyWith(
            color: Get.theme.colorScheme.onPrimary,
          ),
        )
      ],
    ),
  );
}
