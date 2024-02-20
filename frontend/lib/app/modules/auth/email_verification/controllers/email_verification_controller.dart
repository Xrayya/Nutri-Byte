import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerificationController extends GetxController {
  final Rxn<bool?> isVerfied = Rxn<bool?>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await checkVerified();
    await sendEmainVerification();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkVerified() async {
    bool temp = auth.currentUser!.emailVerified;
    isVerfied(temp);
  }

  Future<void> sendEmainVerification() async {
    bool isLimited = await checkIsLimited();
    if (isLimited) {
      Get.snackbar(
        "Error",
        "You can only send verification email once in 1 minute",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);
    await auth.currentUser!.sendEmailVerification();
    await Future.delayed(Duration(seconds: 3));
    await auth.currentUser!.reload();
  }

  Future<bool> checkIsLimited() async {
    final prefs = await SharedPreferences.getInstance();
    int? timestamp = prefs.getInt('timestamp');
    if (timestamp != null) {
      if (DateTime.now().millisecondsSinceEpoch - timestamp > 60000) {
        return false;
      }
    }
    return true;
  }
}
