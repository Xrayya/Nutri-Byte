import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final name = 'Alvin';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.SCANFOOD),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9999)),
        ),
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            const SizedBox(width: 18),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello $name"),
            const Text("Heath start with you"),
            Container(
              margin: const EdgeInsets.only(top: 27.0),
              child: Expanded(
                child: Stack(
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      margin: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 63, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 5,
                              child: SfCircularChart(
                                title: const ChartTitle(
                                  text: "Nutrition Log",
                                  alignment: ChartAlignment.near,
                                ),
                                // TODO: custom legend
                                legend: const Legend(isVisible: true),
                                borderWidth: 1,
                                series: [
                                  RadialBarSeries<ChartData, String>(
                                    dataSource: controller.pieData,
                                    xValueMapper: (ChartData data, _) =>
                                        data.nutritionName,
                                    yValueMapper: (ChartData data, _) =>
                                        data.percentage,
                                    dataLabelMapper: (ChartData data, _) =>
                                        data.text,
                                    cornerStyle: CornerStyle.bothCurve,
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
                                      backgroundImage:
                                          AssetImage('images/placeholder.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Let's check your"),
                                Text("Body Mass Index"),
                              ],
                            ),
                            const SizedBox(
                              height: 23,
                            ),
                            const Card(
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("BMI"),
                                    LinearProgressIndicator(
                                      value: 0.25,
                                    ),
                                  ],
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
            )
          ],
        ),
      ),
    );
  }
}
