import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/data/models/nutritions.dart';
import 'package:nutri_byte/app/data/provider/auth_provider.dart';
import 'package:nutri_byte/app/data/provider/user_provider.dart';

class UserRepository {
  final userProvider = Get.find<UserProvider>();
  final authProvider = Get.find<AuthProvider>();
  Future<NutribyteUser?> registerToDB({
    required String name,
    required String gender,
    required String birthDate,
    required int height,
    required int weight,
    required int activity,
    required int goal,
    required int weightLoss,
    required int weightGain,
  }) async {
    final currentUser = auth.currentUser;
    if (currentUser == null) return null;
    final targetUser = NutribyteUser(
        activityLevel: activity,
        dateOfBirth: birthDate,
        gender: gender,
        name: name,
        goalType: goal,
        height: height,
        uid: currentUser.uid,
        weight: weight,
        weightGainLevel: weightGain,
        weightLossLevel: weightLoss);
    await userProvider.register(targetUser);
    final registeredUser = await userProvider.getUser(currentUser.uid);
    return registeredUser;
  }

  Future<void> addNewDailyLog(DailyLog log) async {
    final checkLog = await userProvider.getDailyLog();
    if (checkLog == null) {
      await userProvider.setDailyLog(log);
    }
  }

  Future<void> updateDailyLog(DailyLog log) async {
    final checkLog = await userProvider.getDailyLog();
    if (checkLog != null) {
      await userProvider.setDailyLog(log);
    }
  }

  Future<DailyLog?> getDailyLog() async {
    final log = await userProvider.getDailyLog();
    return log;
  }

  Future<NutribyteUser?> getUser() {
    return userProvider.getUser(auth.currentUser!.uid);
  }

  Future<Nutritions?> getUserGoalsNutritions() {
    return userProvider.getUserGoalsNutritions(auth.currentUser!.uid);
  }

  Future<void> setQuest() async {
    final checkLog = await userProvider.getDailyLog();
    if (checkLog != null) {
      await userProvider.setDailyQuest(checkLog);
    }
  }

  Future<void> initLog() async {
    final checkLog = await userProvider.getDailyLog();
    if (checkLog == null) {
      final userGoals =
          await userProvider.getUserGoalsNutritions(auth.currentUser!.uid);
      if (userGoals != null) {
        final newLog = DailyLog(
          targetCalories: userGoals.calories,
          targetCarbs: userGoals.carbsGr,
          targetFats: userGoals.fatGr,
          targetProtein: userGoals.proteinGr,
          calories: 0,
          carbs: 0,
          fats: 0,
          protein: 0,
          quests: [],
        );
        await userProvider.setDailyLog(newLog);
        await setQuest();
      }
    }
  }
}
