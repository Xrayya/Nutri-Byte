import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/models/reward.dart';
import 'package:nutri_byte/app/data/models/reward_transaction.dart';

class RewardProvider {
  Future<List<Reward>> getRewards() async {
    final result = await firestore.collection('rewards').get();
    final rewards = <Reward>[];
    for (final doc in result.docs) {
      final reward = Reward.fromJson(doc.data());
      rewards.add(reward);
    }
    return rewards;
  }

  Future<Reward?> getRewardByName(String name) async {
    final result = await firestore
        .collection('rewards')
        .where('name', isEqualTo: name)
        .get();
    if (result.docs.isEmpty) {
      return null;
    }
    final reward = Reward.fromJson(result.docs.first.data());
    return reward;
  }

  Future<List<RewardTransaction>> getRewardTransactions() async {
    final result = await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('reward_transactions')
        .get();
    final transactions = <RewardTransaction>[];
    for (final doc in result.docs) {
      final transaction = RewardTransaction.fromJson(doc.data());
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<void> addTransaction(RewardTransaction transaction) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('reward_transactions')
        .add(transaction.toJson());
  }
}
