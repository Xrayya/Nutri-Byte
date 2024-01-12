import 'package:get/get.dart';

import '../controllers/detail_nutrition_controller.dart';

class DetailNutritionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNutritionController>(
      () => DetailNutritionController(),
    );
  }
}
