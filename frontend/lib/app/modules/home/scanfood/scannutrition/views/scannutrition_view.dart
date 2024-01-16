import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scannutrition_controller.dart';

class ScannutritionView extends GetView<ScannutritionController> {
  const ScannutritionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScannutritionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.food,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
