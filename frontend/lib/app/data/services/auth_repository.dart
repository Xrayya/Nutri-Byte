import 'package:get/get.dart';
import 'package:nutri_byte/app/data/provider/auth_provider.dart';

class AuthRepository {
  final authProvider = Get.find<AuthProvider>();
  Future<void> loginWithEmailPassword(String email, String password) async {
    await authProvider.loginWithEmailPassword(email, password);
  }

  Future<void> registerWithEmailPassword(String email, String password) async {
    await authProvider.registerWithEmailPassword(email, password);
  }

  Future<void> signOut() async {
    await authProvider.signOut();
  }

  Future<void> loginWithGoogleSSO() async {
    await authProvider.loginWithGoogleSSO();
  }
}
