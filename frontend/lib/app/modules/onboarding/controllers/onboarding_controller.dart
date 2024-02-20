import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final index = 0.obs;
  final pageController = PageController();
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

  void setIndex(int i) {
    index.value = i;
  }

  void goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
