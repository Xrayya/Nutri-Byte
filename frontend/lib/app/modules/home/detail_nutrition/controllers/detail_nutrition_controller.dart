import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';

class DetailNutritionController extends GetxController {
  RxList<ChartData> pieData = RxList<ChartData>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    pieData([
      ChartData("Carbs", 98, 400),
      ChartData("Protein", 200, 250),
      ChartData("Fat", 20, 40)
    ]);

  }

  @override
  void onClose() {
    super.onClose();
  }
}
