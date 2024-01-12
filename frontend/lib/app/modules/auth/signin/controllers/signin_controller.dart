import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordObscureText = true.obs;
  final passwordConfirmObscureText = true.obs;
  final isAgreed = false.obs;

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
}
