import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/modules/home/controllers/home_controller.dart';

class DetailprofileController extends GetxController {
  final _homeController = HomeController.i;
  final Rxn<NutribyteUser> currentUser = Rxn<NutribyteUser>();
  final email = auth.currentUser!.email;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    currentUser(_homeController.currentUser.value!);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
