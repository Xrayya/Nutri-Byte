import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/data/models/reward.dart';
import 'package:nutri_byte/app/data/models/reward_transaction.dart';
import 'package:nutri_byte/app/data/services/reward_repository.dart';
import 'package:nutri_byte/app/modules/home/controllers/home_controller.dart';

class RewardsController extends GetxController {
  final _homeController = HomeController.i;
  final Rxn<NutribyteUser?> currentUser = Rxn<NutribyteUser?>();
  final _rewardRepo = Get.find<RewardRepository>();

  final isLoading = false.obs;
  final RxList<Reward> rewards = <Reward>[].obs;
  final RxList<RewardTransaction> userRewards = <RewardTransaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    currentUser(_homeController.currentUser.value);
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchReward();
    await fetchUserReward();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchReward() async {
    isLoading(true);
    rewards.value = await _rewardRepo.getRewards();
    isLoading(false);
  }

  Future<void> fetchUserReward() async {
    isLoading(true);
    userRewards.clear();
    final userTransaction = await _rewardRepo.getRewardTransactions();
    userRewards.addAll(userTransaction);
    userRewards.refresh();
    isLoading(false);
  }

  void claimReward(Reward reward) async {
    final isSuccessful = await _rewardRepo.exchangeReward(reward);
    if (isSuccessful) {
      await fetchUserReward();
      await fetchReward();
      await _homeController.fetchUser();
      currentUser(_homeController.currentUser.value);
      Get.snackbar(
        'Success',
        'You have claimed ${reward.name}!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'You do not have enough NutriCoins!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
