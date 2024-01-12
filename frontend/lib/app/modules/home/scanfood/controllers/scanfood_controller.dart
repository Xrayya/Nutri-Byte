import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanfoodController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  final isCameraInitialized = false.obs;
  final RxString detectedObject = ''.obs;
  final RxDouble confidence = RxDouble(0);
  var cameraCount = 0;

  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTfLite();
  }

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max);
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
    } else {
      print('Permission denied');
    }
  }

  objectDetector(CameraImage image) async {
    final detector = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((e) => e.bytes).toList(),
      asynch: true,
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 1,
      rotation: 90,
      threshold: 0.4,
    );

    if (detector != null && detector.isNotEmpty) {
      log("Result is $detector");
      final obj = detector.first;
      if (obj['confidence'] * 100 > 60) {
        detectedObject(obj['label'].toString());
        confidence(obj['confidence']);
      } else {
        detectedObject('');
        confidence(0);
      }
    }
  }

  Future<void> initTfLite() async {
    await Tflite.loadModel(
      model: 'assets/model/model.tflite',
      labels: 'assets/model/labels.txt',
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }
}
