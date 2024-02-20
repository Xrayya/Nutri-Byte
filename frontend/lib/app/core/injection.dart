import 'package:get/get.dart';
import 'package:nutri_byte/app/data/provider/auth_provider.dart';
import 'package:nutri_byte/app/data/provider/food_provider.dart';
import 'package:nutri_byte/app/data/provider/reward_provider.dart';
import 'package:nutri_byte/app/data/provider/user_provider.dart';
import 'package:nutri_byte/app/data/services/auth_repository.dart';
import 'package:nutri_byte/app/data/services/food_repository.dart';
import 'package:nutri_byte/app/data/services/reward_repository.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';
import 'package:nutri_byte/app/modules/auth/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injection() async {
  Get.put(FoodProvider());
  Get.put(FoodRepository());
  Get.put(AuthProvider());
  Get.put(AuthRepository());
  Get.put(UserProvider());
  Get.put(UserRepository());
  Get.put(RewardProvider());
  Get.put(RewardRepository());
  await SharedPreferences.getInstance();
  Get.put(AuthController());
}
