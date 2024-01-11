import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

class AuthController extends GetxController {
  static get i => Get.find<AuthController>();
  late Rx<User?> firebaseUser;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
  }

  @override
  void onClose() {
    super.onClose();
  }

  _setScreen(User? user) {
    if (user == null) {}
  }
}
