import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';

class HomeController extends GetxController {
  final userRepo = Get.find<UserRepository>();
  final pieData = <ChartData>[
    ChartData("Carbs", 98, 400),
    ChartData("Protein", 200, 250),
    ChartData("Fat", 20, 40)
  ];
  final Rxn<NutribyteUser?> currentUser = Rxn<NutribyteUser?>();
  final Rxn<int?> nutriCoin = Rxn<int?>();
  final Rxn<double?> bmi = Rxn<double?>();
  final navbarIndex = 0.obs;
  final isLoading = false.obs;
  static HomeController get i => Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchUser();
    nutriCoin(0);
    bmi(0.25);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchUser() async {
    isLoading(true);
    currentUser(await userRepo.getUser());
    isLoading(false);
  }
}
