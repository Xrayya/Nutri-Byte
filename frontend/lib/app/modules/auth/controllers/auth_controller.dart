import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

class AuthController extends GetxController {
  static get i => Get.find<AuthController>();
  late Rx<User?> firebaseUser;
  final UserRepository _userRepository = Get.find<UserRepository>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }

  _setScreen(User? user) async {
    if (user == null) {
      Get.offAllNamed(Routes.ONBOARDING);
    } else {
      final userDb = await firestore.collection('users').doc(user.uid).get();
      if (userDb.exists) {
        await _userRepository.initLog();
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.REGISTER);
      }
    }
  }
}
