import 'package:nutri_byte/app/core/constant.dart';
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
}
