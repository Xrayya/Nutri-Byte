import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FABWithLabel extends StatelessWidget {
  const FABWithLabel({
    super.key,
    required this.label,
    required this.child,
    this.onPress,
  });

  final Function()? onPress;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          FloatingActionButton.small(
            heroTag: UniqueKey(),
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
}
