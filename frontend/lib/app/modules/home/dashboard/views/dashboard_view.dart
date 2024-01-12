import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/dashboard_controller.dart';

String name = "John Doe";

var pieData = <ChartData>[
  ChartData("Carbs", 98, 400),
  ChartData("Protein", 200, 250),
  ChartData("Fat", 20, 40)
];

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello $name"),
            Text("Heath start with you"),
            Container(
              margin: EdgeInsets.only(top: 27.0),
              child: Expanded(
                child: Stack(
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(24, 63, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 5,
                              child: SfCircularChart(
                                title: ChartTitle(
                                  text: "Nutrition Log",
                                  alignment: ChartAlignment.near,
                                ),
                                // TODO: custom legend
                                legend: Legend(isVisible: true),
                                borderWidth: 1,
                                series: [
                                  RadialBarSeries<ChartData, String>(
                                    dataSource: pieData,
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
                                annotations: [
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
                            SizedBox(
                              height: 23,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Let's check your"),
                                Text("Body Mass Index"),
                              ],
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
