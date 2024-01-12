import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';

import '../controllers/scanfood_controller.dart';

class ScanfoodView extends GetView<ScanfoodController> {
  const ScanfoodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isCameraInitialized.value
            ? Column(
                children: [
                  CameraPreview(controller.cameraController),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 48),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 24,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                            color: NutriByteColor.light.primary.tone(70),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cameraswitch_outlined, ))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
