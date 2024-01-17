import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutriByteBackButton extends StatelessWidget {
  const NutriByteBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9999))),
        ),
      ),
    );
  }
}
