import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';

import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  const RewardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: Get.height * 0.19,
              color: Get.theme.colorScheme.primaryContainer),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16),
                child: FloatingActionButton(
                  heroTag: 'rewards_back',
                  child: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Get.theme.primaryColor.tone(80),
                      ),
                      child: Text(
                        '330 NutriCoins',
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    const Text(
                      'Claim your rewards now!',
                      style: TextStyle(
                        color: Color(0xFF294B19),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    rewardCard(
                        price: 5000,
                        title: '1 Month Premium',
                        onPress: () => Get.snackbar(
                            'Claimed', 'You have claimed this reward')),
                    rewardCard(
                        price: 5000,
                        title: '1 Month Premium',
                        onPress: () => Get.snackbar(
                            'Claimed', 'You have claimed this reward')),
                    rewardCard(
                        price: 5000,
                        title: '1 Month Premium',
                        onPress: () => Get.snackbar(
                            'Claimed', 'You have claimed this reward')),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Card rewardCard({
    required String title,
    required int price,
    void Function()? onPress,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(color: Get.theme.colorScheme.primaryContainer),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/gift.png',
                width: 80,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Get.textTheme.titleLarge!
                          .copyWith(color: Get.theme.colorScheme.primary),
                    ),
                    Text(
                      '${price} NutriCoins',
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: Get.theme.colorScheme.primary),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: onPress,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 33),
                      primary: Colors.white,
                      elevation: 2,
                      textStyle: const TextStyle(
                          color: Color(0xFF43483E),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      disabledBackgroundColor:
                          const Color(0xFF1D1B20).withOpacity(0.12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Claim'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
