import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';
import 'package:nutri_byte/app/data/models/food.dart';
import 'package:nutri_byte/app/data/services/food_repository.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';
import 'package:nutri_byte/app/modules/home/scanfood/controllers/scanfood_controller.dart';

class ScannutritionController extends GetxController {
  final keys = Get.arguments['food'] as String;
  final Rxn<Food> food = Rxn<Food>();
  final _foodRepo = Get.find<FoodRepository>();
  final isLoading = false.obs;
  final _userRepo = Get.find<UserRepository>();
  final scanFoodController = Get.find<ScanfoodController>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchFood();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchFood() async {
    isLoading.value = true;
    try {
      final result = await _foodRepo.getFood(keys);
      if (result != null) {
        food.value = result;
      }
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.message ?? 'Error fetching food',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void addFood() async {
    isLoading.value = true;
    try {
      final log = await _userRepo.getDailyLog();
      if (log != null && food.value != null) {
        log.calories += food.value!.calories;
        log.carbs += food.value!.carbs;
        log.fats += food.value!.fats;
        log.protein += food.value!.protein;
        await _userRepo.updateDailyLog(log);
      } else {
        if (food.value != null) {
          final newLog = DailyLog(
              // TODO: add functionality to calculate target calories, fats, carbs, and protein from users
              targetCalories: 2000,
              targetCarbs: 200,
              targetFats: 200,
              targetProtein: 200,
              calories: food.value!.calories,
              carbs: food.value!.carbs,
              fats: food.value!.fats,
              protein: food.value!.protein);
          await _userRepo.addNewDailyLog(newLog);
        }
      }
      back();
      Get.snackbar('Success', 'Food added to daily log',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.message ?? 'Error adding food',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void back() {
    Get.back();
    scanFoodController.reinitializeCamera();
  }
}
