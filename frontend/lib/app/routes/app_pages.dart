import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/dashboard/bindings/dashboard_binding.dart';
import '../modules/home/dashboard/views/dashboard_view.dart';
import '../modules/home/detail_nutrition/bindings/detail_nutrition_binding.dart';
import '../modules/home/detail_nutrition/views/detail_nutrition_view.dart';
import '../modules/home/views/home_view.dart';

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
          name: _Paths.DASHBOARD,
          page: () => const DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.DETAIL_NUTRITION,
          page: () => const DetailNutritionView(),
          binding: DetailNutritionBinding(),
        ),
      ],
    ),
  ];
}
