import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/data/services/auth_repository.dart';

class SigninController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordObscureText = true.obs;
  final passwordConfirmObscureText = true.obs;
  final isAgreed = false.obs;
  final authRepo = Get.find<AuthRepository>();

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
    if (formKey.currentState!.validate()) {
      if (passwordEditingController.text !=
          passwordConfirmEditingController.text) {
        Get.snackbar('Error', 'Password and confirm password do not match',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      if (!isAgreed.value) {
        Get.snackbar('Error', 'Please agree to the terms and conditions',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      
      try {
        await authRepo.registerWithEmailPassword(
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
}
