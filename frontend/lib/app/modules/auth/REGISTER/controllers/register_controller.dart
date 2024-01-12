import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/utils/helper.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final userRepo = Get.find<UserRepository>();
  final weightEditingController = TextEditingController();
  final heightEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  final nameEditingController = TextEditingController();

  final Rxn<String> gender = Rxn<String>();
  final Rxn<String> name = Rxn<String>();
  final Rxn<String> birthDate = Rxn<String>();
  final Rxn<int> height = Rxn<int>();
  final Rxn<int> weight = Rxn();
  final Rxn<int> activity = Rxn<int>();
  final Rxn<int> goal = Rxn<int>();
  final Rxn<int> weightLoss = Rxn<int>();
  final Rxn<int> weightGain = Rxn<int>();

  final index = 1.obs;
  final isLoading = false.obs;

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

  void register() async {
    print('register runnn');
    isLoading(false);
    try {
      if (!batchIsNotEmpty([
        name.value,
        gender.value,
        birthDate.value,
        height.value.toString(),
        weight.value.toString(),
        activity.value.toString(),
        goal.value.toString(),
        weightLoss.value.toString(),
        weightGain.value.toString()
      ])) return;

      print('not empty all');

      final registeredUser = await userRepo.registerToDB(
          name: name.value!,
          gender: gender.value!,
          birthDate: birthDate.value!,
          height: height.value!,
          weight: weight.value!,
          activity: activity.value!,
          goal: goal.value!,
          weightLoss: weightLoss.value!,
          weightGain: weightGain.value!);
      if (registeredUser == null) return;
      Get.snackbar('Success', 'Successfully registered');
      Get.offAllNamed(Routes.HOME);
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.message ?? 'Error occured');
    } catch (e) {
      Get.snackbar('Error', 'Unknown error occured, please contact developer');
    }
    isLoading(false);
  }
}
