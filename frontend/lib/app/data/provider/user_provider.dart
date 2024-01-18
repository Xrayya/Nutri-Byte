import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/core/utils/helper.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';

class UserProvider {
  Future<void> register(NutribyteUser user) async {
    await firestore.collection('users').doc(user.uid).set(user.toJson());
  }

  Future<NutribyteUser?> getUser(String uid) async {
    final user = await firestore.collection('users').doc(uid).get();
    if (user.exists) {
      return NutribyteUser.fromJson(user.data()!);
    } else {
      return null;
    }
  }

  Future<List<DailyLog>> getDailyLogs() async {
    final result = await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('daily_logs')
        .get();
    final logs = result.docs.map((e) => DailyLog.fromJson(e.data())).toList();
    return logs;
  }

  Future<DailyLog?> getDailyLog() async {
    final date = DateTime.now();
    // format to yyyy-mm-dd
    final dateString = formatDateTime(date);
    final result = await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('daily_logs')
        .doc(dateString)
        .get();
    if (result.exists) {
      return DailyLog.fromJson(result.data()!);
    } else {
      return null;
    }
  }

  Future<void> setDailyLog(DailyLog log) async {
    final date = DateTime.now();
    final dateString = formatDateTime(date);
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('daily_logs')
        .doc(dateString)
        .set(log.toJson());
  }

  Future<void> updateUserPoints(int points) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({'points': points});
  }
}
