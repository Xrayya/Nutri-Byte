import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanfoodController extends GetxController {
  final Rxn<CameraController> cameraController = Rxn<CameraController>();
  late List<CameraDescription> cameras;

  // final RxString detectedObject = ''.obs;
  // final RxDouble confidence = RxDouble(0);
  final isFlashOn = false.obs;
  var cameraCount = 0;
  final isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTfLite();
  }

  @override
  void onClose() async {
    super.onClose();
    // await cameraController.value!.stopImageStream();
    await cameraController.value!.dispose();
    await Tflite.close();
  }

  void toggleFlash() {
    isFlashOn(!isFlashOn.value);
    cameraController.value!
        .setFlashMode(isFlashOn.value ? FlashMode.torch : FlashMode.off);
  }

  void changeCamera() async {
    if (cameraController.value == null) return;
    await cameraController.value!.stopImageStream();
    print('camera length ${cameras.length}');
    int cameraIndex = cameras.indexOf(cameraController.value!.description);
    cameraIndex = cameraIndex < cameras.length - 1 ? cameraIndex + 1 : 0;
    cameraController.value = CameraController(cameras[1], ResolutionPreset.max);
    cameraController.value!.initialize().then((value) {
      // cameraController.value!.startImageStream((image) {
      //   cameraCount++;
      //   if (cameraCount % 10 == 0) {
      //     cameraCount = 0;
      //     objectDetector(image);
      //   }
      //   update();
      // });
      cameraController.refresh();
    });
  }

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController.value =
          CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.value!.initialize().then((value) {
        // cameraController.value!.startImageStream((image) {
        //   cameraCount++;
        //   if (cameraCount % 10 == 0) {
        //     cameraCount = 0;
        //     objectDetector(image);
        //   }
        //   update();
        // });
        cameraController.refresh();
      });
    } else {
      print('Permission denied');
    }
  }

  // objectDetector(CameraImage image) async {
  //   final detector = await Tflite.runModelOnFrame(
  //     bytesList: image.planes.map((e) => e.bytes).toList(),
  //     asynch: true,
  //     imageHeight: image.height,
  //     imageWidth: image.width,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //     numResults: 1,
  //     rotation: 90,
  //     threshold: 0.4,
  //   );

  //   if (detector != null && detector.isNotEmpty) {
  //     log("Result is $detector");
  //     final obj = detector.first;
  //     if (obj['confidence'] * 100 > 60) {
  //       detectedObject(obj['label'].toString());
  //       confidence(obj['confidence']);
  //     } else {
  //       detectedObject('');
  //       confidence(0);
  //     }
  //   }
  // }

  Future<void> initTfLite() async {
    await Tflite.loadModel(
      model: 'assets/model/model.tflite',
      labels: 'assets/model/labels2.txt',
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }

  void scanSingleImage() async {
    isProcessing(true);
    final image = await cameraController.value!.takePicture();
    //temporary stop the camera or paused the camera view
    await cameraController.value!.pausePreview();
    log('camera paused');
    await Future.delayed(const Duration(seconds: 2));
    final detector = await Tflite.runModelOnImage(
      imageMean: 127.5,
      imageStd: 127.5,
      asynch: true,
      path: image.path,
      numResults: 1,
      threshold: 0.4,
    );
    if (detector != null && detector.isNotEmpty) {
      log("Result is $detector");
      final obj = detector.first;
      if (obj['confidence'] * 100 > 50) {
        final food = obj['label'].toString();
        // detectedObject(food);
        // confidence(obj['confidence']);
        Get.toNamed(Routes.SCANNUTRITION, arguments: {'food': food});
        isProcessing(false);
        return;
      }
    }
    await cameraController.value!.resumePreview();
    log('camera resumed');
    Get.snackbar('Error', 'No object detected',
        snackPosition: SnackPosition.BOTTOM);
    isProcessing(false);
  }
}
