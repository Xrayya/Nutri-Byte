import 'package:get/get.dart';

import '../controllers/scanfood_controller.dart';

class ScanfoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScanfoodController());
  }
}
