import 'package:get/get.dart';

import '../controllers/scannutrition_controller.dart';

class ScannutritionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannutritionController>(
      () => ScannutritionController(),
    );
  }
}
