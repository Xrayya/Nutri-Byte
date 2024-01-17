import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/modules/home/views/homesection_view.dart';
import 'package:nutri_byte/app/modules/home/views/profilesection_view.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:nutri_byte/app/widgets/fab_with_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.colorScheme.primary.tone(70),
        onPressed: () => Get.toNamed(Routes.SCANFOOD),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9999))),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 5,
          enableFeedback: false,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          iconSize: 38,
          selectedIconTheme:
              IconThemeData(size: 38, color: Get.theme.colorScheme.primary),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex:
              controller.navbarIndex.value, // Set the initial index here
          onTap: (int index) {
            controller.navbarIndex.value = index;
          },
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.navbarIndex.value,
          children: const [
            HomesectionView(),
            ProfilesectionView(),
          ],
        ),
      ),
    );
  }
}
