import 'package:get/get.dart';
import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/core/utils/helper.dart';
import 'package:nutri_byte/app/data/models/reward.dart';
import 'package:nutri_byte/app/data/models/reward_transaction.dart';
import 'package:nutri_byte/app/data/provider/reward_provider.dart';
import 'package:nutri_byte/app/data/provider/user_provider.dart';

class RewardRepository {
  final RewardProvider _rewardProvider = Get.find<RewardProvider>();
  final UserProvider _userProvider = Get.find<UserProvider>();

  Future<List<Reward>> getRewards() async {
    return await _rewardProvider.getRewards();
  }

  Future<Reward?> getRewardByName(String name) async {
    return await _rewardProvider.getRewardByName(name);
  }

  Future<bool> exchangeReward(Reward reward) async {
    final userTransaction = await _rewardProvider.getRewardTransactions();
    bool isUnique = true;
    userTransaction.forEach((element) {
      if (element.name == reward.name) {
        isUnique = false;
      }
    });

    if (!isUnique) {
      return false;
    }

    final user = await _userProvider.getUser(auth.currentUser!.uid);
    if (user == null) {
      return false;
    }

    if (user.points < reward.price) {
      return false;
    }

    final newPoints = user.points - reward.price;

    await _userProvider.updateUserPoints(newPoints);

    final transaction = RewardTransaction(
      name: reward.name,
      date: formatDateTime(DateTime.now()),
    );

    await _rewardProvider.addTransaction(transaction);

    return true;
  }

  Future<List<RewardTransaction>> getRewardTransactions() async {
    return await _rewardProvider.getRewardTransactions();
  }
}
