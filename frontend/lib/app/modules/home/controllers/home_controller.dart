import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models.dart';

class HomeController extends GetxController {
  final pieData = <ChartData>[
    ChartData("Carbs", 98, 400),
    ChartData("Protein", 200, 250),
    ChartData("Fat", 20, 40)
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
