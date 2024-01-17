import 'package:get/get.dart';

import '../controllers/detailprofile_controller.dart';

class DetailprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailprofileController>(
      () => DetailprofileController(),
    );
  }
}
