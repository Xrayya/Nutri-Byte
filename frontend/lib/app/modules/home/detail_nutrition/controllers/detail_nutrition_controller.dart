import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';

class DetailNutritionController extends GetxController {
  final todayLog = Get.arguments as DailyLog;
  Rx<List<ChartData>> pieData = Rx<List<ChartData>>([]);

  @override
  void onInit() async {
    super.onInit();
    await fetchTodayLog();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchTodayLog() async {
    pieData([
      ChartData("Carbs", todayLog.carbs, todayLog.targetCarbs),
      ChartData("Protein", todayLog.protein, todayLog.targetProtein),
      ChartData("Fat", todayLog.fats, todayLog.targetFats)
    ]);
    pieData.refresh();
  }
}
