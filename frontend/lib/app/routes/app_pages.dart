import 'package:get/get.dart';

import '../modules/auth/REGISTER/bindings/register_binding.dart';
import '../modules/auth/REGISTER/views/register_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/email_verification/bindings/email_verification_binding.dart';
import '../modules/auth/email_verification/views/email_verification_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/detail_nutrition/bindings/detail_nutrition_binding.dart';
import '../modules/home/detail_nutrition/views/detail_nutrition_view.dart';
import '../modules/home/detailprofile/bindings/detailprofile_binding.dart';
import '../modules/home/detailprofile/views/detailprofile_view.dart';
import '../modules/home/quests/bindings/quests_binding.dart';
import '../modules/home/quests/views/quests_view.dart';
import '../modules/home/rewards/bindings/rewards_binding.dart';
import '../modules/home/rewards/views/rewards_view.dart';
import '../modules/home/scanfood/bindings/scanfood_binding.dart';
import '../modules/home/scanfood/scannutrition/bindings/scannutrition_binding.dart';
import '../modules/home/scanfood/scannutrition/views/scannutrition_view.dart';
import '../modules/home/scanfood/views/scanfood_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_NUTRITION,
          page: () => const DetailNutritionView(),
          binding: DetailNutritionBinding(),
        ),
        GetPage(
          name: _Paths.SCANFOOD,
          page: () => const ScanfoodView(),
          binding: ScanfoodBinding(),
          children: [
            GetPage(
              name: _Paths.SCANNUTRITION,
              page: () => const ScannutritionView(),
              binding: ScannutritionBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.QUESTS,
          page: () => const QuestsView(),
          binding: QuestsBinding(),
        ),
        GetPage(
          name: _Paths.REWARDS,
          page: () => const RewardsView(),
          binding: RewardsBinding(),
        ),
        GetPage(
          name: _Paths.DETAILPROFILE,
          page: () => const DetailprofileView(),
          binding: DetailprofileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.SIGNIN,
          page: () => const SigninView(),
          binding: SigninBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: _Paths.EMAIL_VERIFICATION,
          page: () => const EmailVerificationView(),
          binding: EmailVerificationBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
