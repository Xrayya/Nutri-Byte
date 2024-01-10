import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../data/models.dart';
import '../controllers/detail_nutrition_controller.dart';

var pieData = <ChartData>[
  ChartData("Carbs", 98, 400),
  ChartData("Protein", 200, 250),
  ChartData("Fat", 20, 40)
];

class DetailNutritionView extends GetView<DetailNutritionController> {
  const DetailNutritionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.arrow_back),
                      onPressed: () {},
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9999))),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(9999))),
                    ),
                  ),
                ),
                SfCircularChart(
                  // TODO: custom legend
                  legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      orientation: LegendItemOrientation.vertical,
                      height: '100%'),
                  borderWidth: 1,
                  series: [
                    RadialBarSeries<ChartData, String>(
                      dataSource: pieData,
                      xValueMapper: (ChartData data, _) => data.nutritionName,
                      yValueMapper: (ChartData data, _) => data.percentage,
                      dataLabelMapper: (ChartData data, _) => data.text,
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
                        backgroundImage: AssetImage('images/person.jpg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
