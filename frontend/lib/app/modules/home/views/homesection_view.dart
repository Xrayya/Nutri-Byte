import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/modules/home/controllers/home_controller.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:nutri_byte/app/widgets/fab_with_button.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomesectionView extends GetView<HomeController> {
  const HomesectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 52),
              child: Obx(
                () => RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Hello ${controller.currentUser.value?.name}\n",
                      style: const TextStyle(
                        color: Color(0xFF91C788),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Health starts with you",
                      style: Get.textTheme.titleMedium!
                          .copyWith(color: const Color(0xFF7B7B7B)),
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 27.0),
                child: Stack(
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      margin: const EdgeInsets.only(top: 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 63, 24, 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        "Nutrition Log",
                                        style: Get.textTheme.headlineSmall,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Obx(
                                          () => controller.pieData.value == null
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : SfCircularChart(
                                                  legend: const Legend(
                                                    isVisible: true,
                                                    position:
                                                        LegendPosition.right,
                                                  ),
                                                  borderWidth: 1,
                                                  series: [
                                                    RadialBarSeries<ChartData,
                                                        String>(
                                                      dataSource: controller
                                                          .pieData.value,
                                                      xValueMapper: (ChartData
                                                                  data,
                                                              _) =>
                                                          data.nutritionName,
                                                      yValueMapper:
                                                          (ChartData data, _) =>
                                                              data.percentage,
                                                      dataLabelMapper:
                                                          (ChartData data, _) =>
                                                              data.text,
                                                      cornerStyle:
                                                          CornerStyle.bothCurve,
                                                      gap: '10%',
                                                      radius: '100%',
                                                      maximumValue: 100,
                                                    ),
                                                  ],
                                                  annotations: const [
                                                    CircularChartAnnotation(
                                                      height: '90%',
                                                      width: '90%',
                                                      widget: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'images/placeholder.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        )),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      alignment: Alignment.centerRight,
                                      child: nutriByteButton(
                                        onPressed: () => Get.toNamed(
                                          Routes.DETAIL_NUTRITION,
                                          arguments: controller.todayLog.value,
                                        ),
                                        text: "See More",
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Let's check your",
                                  style: Get.textTheme.titleLarge,
                                ),
                                Text(
                                  "Body Mass Index",
                                  style: Get.textTheme.titleLarge,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "BMI",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "15",
                                          style: Get.textTheme.bodyLarge,
                                        ),
                                        Text(
                                          "50",
                                          style: Get.textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => LinearProgressIndicator(
                                        value: controller.bmi.value ?? 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      color: NutriByteColor.seedColor.tone(80),
                      elevation: 3,
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  "${controller.currentUser.value?.points.toString() ?? '0'} NutriCoins",
                                  style: Get.textTheme.titleLarge!.copyWith(
                                    color: Get.theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  FABWithLabel(
                                    label: "Quest",
                                    child: const Icon(Icons.checklist),
                                    onPress: () {
                                      Get.toNamed(Routes.QUESTS);
                                    },
                                  ),
                                  FABWithLabel(
                                    label: "Rewards",
                                    child: const Icon(Icons.card_giftcard),
                                    onPress: () => Get.toNamed(Routes.REWARDS),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
