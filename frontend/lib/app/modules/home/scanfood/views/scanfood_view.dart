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
                          EdgeInsets.symmetric(vertical: 5, horizontal: 48),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => Text(controller.detectedObject.value),
                          ),
                          Obx(
                            () => Text(
                              controller.confidence.value.toString(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                backgroundColor:
                                    Get.theme.colorScheme.primary.tone(60),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.cameraswitch_outlined,
                                  ))
                            ],
                          ),
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
