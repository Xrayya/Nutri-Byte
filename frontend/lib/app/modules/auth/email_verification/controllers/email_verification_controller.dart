import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';

class EmailVerificationController extends GetxController {
  final Rxn<bool?> isVerfied = Rxn<bool?>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> checkVerified() async {
    bool temp = auth.currentUser!.emailVerified;
    isVerfied(temp);
  }
}
