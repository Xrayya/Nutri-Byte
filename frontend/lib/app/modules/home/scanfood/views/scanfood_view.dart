import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';

import '../controllers/scanfood_controller.dart';

class ScanfoodView extends GetView<ScanfoodController> {
  const ScanfoodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.cameraController.value != null
            ? Stack(
                children: [
                  IntrinsicHeight(
                    child: Stack(
                      children: [
                        Obx(
                          () => IntrinsicHeight(
                            child: Stack(
                              children: [
                                CameraPreview(
                                    controller.cameraController.value!),
                                Container(
                                  color: controller.isProcessing.value
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.transparent,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(Icons.close),
                                  color: Colors.black,
                                ),
                                Obx(
                                  () => IconButton(
                                    onPressed: () => controller.toggleFlash(),
                                    icon: Icon(controller.isFlashOn.value
                                        ? Icons.flash_on
                                        : Icons.flash_off),
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: controller.isProcessing.value
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Scanning the food',
                                      style: Get.textTheme.labelLarge,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const CircularProgressIndicator()
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Container(
                        height: Get.height * 0.20,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 48),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32),
                            topLeft: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Obx(
                            //   () => Text(controller.detectedObject.value),
                            // ),
                            // Obx(
                            //   () => Text(
                            //     controller.confidence.value.toString(),
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 50,
                                ),
                                FloatingActionButton(
                                  heroTag: 'scanfood_camera',
                                  onPressed: () => controller.scanSingleImage(),
                                  backgroundColor:
                                      Get.theme.colorScheme.primary.tone(60),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: IconButton(
                                      onPressed: () =>
                                          controller.changeCamera(),
                                      icon: const Icon(
                                        Icons.cameraswitch_outlined,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
