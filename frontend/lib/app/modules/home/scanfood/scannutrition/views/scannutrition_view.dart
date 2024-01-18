import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';

import '../controllers/scannutrition_controller.dart';

class ScannutritionView extends GetView<ScannutritionController> {
  const ScannutritionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.food.value != null
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 16),
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
                              height: 25,
                            ),
                            FloatingActionButton(
                              heroTag: 'scannutrition_back',
                              onPressed: () => controller.back(),
                              child: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Do you want to eat this ${controller.food.value!.name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Get.theme.colorScheme.secondary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.35,
                                  child: nutriByteButton(
                                      elevation: 0,
                                      text: 'Not Eat',
                                      type: NutriByteButtonType.secondary,
                                      onPressed: () => controller.back()),
                                ),
                                const SizedBox(
                                  width: 26,
                                ),
                                SizedBox(
                                  width: Get.width * 0.35,
                                  child: nutriByteButton(
                                      text: 'Eat',
                                      onPressed: () => controller.addFood()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nutrition Info',
                              style: Get.textTheme.headlineSmall!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Card(
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 36),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    nutritionCols(
                                        'Carbs', 'Protein', 'Fat', 'Calories'),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    nutritionCols(': ', ': ', ': ', ': '),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    nutritionCols(
                                      controller.food.value!.carbs.toString(),
                                      controller.food.value!.protein.toString(),
                                      controller.food.value!.fats.toString(),
                                      controller.food.value!.calories
                                          .toString(),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    nutritionCols('g', 'g', 'g', 'Kcal')
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 34,
                            ),
                            Text(
                              'You will consume 107.93 g from 100 g of targeted Protein. You have reached your calories consumption limit. (msh dummy sabarr ya )',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyLarge!.copyWith(
                                  color: Get.theme.colorScheme.secondary),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                    "${controller.keys} is not found :((",
                    style: Get.textTheme.bodyLarge,
                  )),
      ),
    );
  }

  IntrinsicWidth nutritionCols(
      String text1, String text2, String text3, String text4) {
    TextStyle textStyle =
        Get.textTheme.bodyLarge!.copyWith(color: const Color(0xFF294B19));
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text1, style: textStyle),
          const SizedBox(
            height: 14,
          ),
          Text(text2, style: textStyle),
          const SizedBox(
            height: 14,
          ),
          Text(text3, style: textStyle),
          const SizedBox(
            height: 14,
          ),
          Text(
            text4,
            style: textStyle.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
