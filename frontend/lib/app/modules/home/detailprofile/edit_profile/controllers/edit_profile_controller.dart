import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/core/values/strings.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/modules/home/controllers/home_controller.dart';

class EditProfileController extends GetxController {
  final _homeController = HomeController.i;
  final Rxn<NutribyteUser> currentUser = Rxn<NutribyteUser>();
  final email = auth.currentUser!.email;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController DOBController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController activityController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    currentUser(_homeController.currentUser.value!);
    emailController.value = emailController.value.copyWith(text: email ?? '');
    usernameController.value = usernameController.value.copyWith(
      text: currentUser.value!.name,
    );
    genderController.value = genderController.value.copyWith(
      text: currentUser.value!.gender,
    );
    DOBController.value = DOBController.value.copyWith(
      text: currentUser.value!.dateOfBirth,
    );
    heightController.value = heightController.value.copyWith(
      text: "${currentUser.value!.height} cm",
    );
    weightController.value = weightController.value.copyWith(
      text: "${currentUser.value!.weight} kg",
    );
    goalsController.value = goalsController.value.copyWith(
      text: goalList[currentUser.value!.goalType - 1],
    );
    activityController.value = activityController.value.copyWith(
      text: activityPerWeekList[currentUser.value!.activityLevel - 1]
          .split(':')[0],
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
