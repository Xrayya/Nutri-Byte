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

Future<void> injection() async {
  Get.put(AuthController());
  Get.put(AuthProvider());
  Get.put(UserProvider());
  Get.put(FoodProvider());
  Get.put(FoodRepository());
  Get.put(UserRepository());
  Get.put(AuthRepository());
  Get.put(RewardProvider());
  Get.put(RewardRepository());
}
