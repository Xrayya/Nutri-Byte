import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/modules/home/controllers/home_controller.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';

class ProfilesectionView extends GetView<HomeController> {
  const ProfilesectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                        color: Get.theme.colorScheme.primaryContainer,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/dummy_pp.png'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.currentUser.value?.name ?? '',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Get.theme.colorScheme.secondary),
                                    ),
                                    Text(
                                      'Basic Member',
                                      style: Get.textTheme.bodyLarge!.copyWith(
                                          color:
                                              Get.theme.colorScheme.secondary),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: nutriByteButton(
                                          onPressed: () =>
                                              Get.toNamed(Routes.DETAILPROFILE),
                                          text: 'See Profile',
                                          type: NutriByteButtonType.primary),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 21, vertical: 11),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFFFFDDB0),
                                    const Color(0xFFE39D19).withOpacity(0.70)
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Be Our Premium Quest',
                                    style: Get.textTheme.titleLarge!.copyWith(
                                        color: Get.theme.colorScheme.secondary),
                                  ),
                                  Text(
                                    'Upgrade your account to get full access by joining our Premium',
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                        color: Get.theme.colorScheme.secondary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      child: Text(
                                        'Join Now',
                                        style: TextStyle(
                                            color:
                                                Get.theme.colorScheme.primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          profileButtonTile(
                            icon: Icons.vpn_key,
                            text: 'Change Password',
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          profileButtonTile(
                            icon: Icons.history,
                            text: 'Transaction History',
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          profileButtonTile(
                            icon: Icons.help,
                            text: 'FAQ',
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          profileButtonTile(
                            icon: Icons.info,
                            text: 'About',
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          profileButtonTile(
                            icon: Icons.logout_sharp,
                            text: 'Log Out',
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  ElevatedButton profileButtonTile(
      {required String text, required IconData icon, VoidCallback? onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 19),
        primary: const Color(0xFFF2F5EA),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Get.theme.colorScheme.primary,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: Get.textTheme.titleMedium!
                .copyWith(color: Get.theme.colorScheme.primary),
          )
        ],
      ),
    );
  }
}
