import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pages = [
      ['assets/images/onboarding_1.png', 'Start Your Healthy\nJourney'],
      ['assets/images/onboarding_2.png', 'Track Your\nNutrition Easily'],
      ['assets/images/onboarding_3.png', 'Fun Quest to Keep\nYou Motivated']
    ];
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              'assets/images/nutribyte.svg',
              width: Get.width * 0.5,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller.pageController,
                onPageChanged: controller.setIndex,
                children: pages
                    .map((e) => Column(
                          children: [
                            Image.asset(
                              e[0],
                              width: Get.width * 0.6,
                              fit: BoxFit.fitWidth,
                            ),
                            const Spacer(),
                            Text(
                              e[1],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: NutriByteColor.seedColor.tone(60),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Obx(() {
                  final isSelected = controller.index.value == index;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isSelected ? 20 : 12,
                    height: isSelected ? 10 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isSelected ? Color(0xFFFF8473) : Color(0xFFFFC0B8),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: nutriByteButton(
                    text: "Let's get started",
                    type: NutriByteButtonType.primary,
                    onPressed: controller.goToLogin),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
