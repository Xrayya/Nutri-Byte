import 'dart:math';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/data/services/auth_repository.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';

class HomeController extends GetxController {
  final userRepo = Get.find<UserRepository>();
  final Rxn<List<ChartData>> pieData = Rxn<List<ChartData>>();
  final Rxn<NutribyteUser?> currentUser = Rxn<NutribyteUser?>();
  final Rxn<int?> nutriCoin = Rxn<int?>();
  final Rxn<double?> bmi = Rxn<double?>();
  final Rxn<DailyLog?> todayLog = Rxn<DailyLog?>();
  final navbarIndex = 0.obs;
  final isLoading = false.obs;
  final authRepo = AuthRepository();
  static HomeController get i => Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchUser();
    nutriCoin(0);
    await fetchTodayLog();
    await calculateBMI();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchTodayLog() async {
    var log = await userRepo.getDailyLog();
    todayLog(log);
    if (log != null) {
      pieData([
        ChartData("Carbs", log.carbs, log.targetCarbs),
        ChartData("Protein", log.protein, log.targetProtein),
        ChartData("Fat", log.fats, log.targetFats)
      ]);
    }
    pieData.refresh();
  }

  Future<void> calculateBMI() async {
    print((currentUser.value!.weight / pow(currentUser.value!.height / 100.0, 2)));
    bmi((currentUser.value!.weight / pow(currentUser.value!.height / 100.0, 2) - 15) /
        35);
  }

  Future<void> fetchUser() async {
    isLoading(true);
    currentUser(await userRepo.getUser());
    isLoading(false);
  }

  Future<void> signOut() async {
    await authRepo.signOut();
  }
}
