import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/data/services/auth_repository.dart';

class LoginController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final obscureText = true.obs;
  final authRepo = Get.find<AuthRepository>();

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

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        await authRepo.loginWithEmailPassword(
            emailEditingController.text, passwordEditingController.text);
      } on FirebaseAuthException catch (error) {
        Get.snackbar(
          'Error',
          error.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void loginWithGoogle() async {
    try {
      await authRepo.loginWithGoogleSSO();
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Error',
        error.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
