import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/chart_data.dart';
import 'package:nutri_byte/app/widgets/nutribyte_back_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/detail_nutrition_controller.dart';

var data = [
  ["Total Calories", ":", "1844.17", "Kcal"],
  ["Net Calories", ":", "1844.17", "Kcal"],
  ["Goal", ":", "1637", "Kcal"]
];

class DetailNutritionView extends GetView<DetailNutritionController> {
  const DetailNutritionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      heroTag: UniqueKey(),
                      onPressed: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SfCircularChart(
                    // TODO: custom legend
                    legend: const Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      orientation: LegendItemOrientation.vertical,
                      height: '100%',
                    ),
                    borderWidth: 1,
                    series: [
                      RadialBarSeries<ChartData, String>(
                        dataSource: controller.pieData,
                        xValueMapper: (ChartData data, _) => data.nutritionName,
                        yValueMapper: (ChartData data, _) => data.percentage,
                        dataLabelMapper: (ChartData data, _) => data.text,
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
                          backgroundImage: AssetImage('images/placeholder.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(27.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(38, 52, 38, 52),
                  child: Table(
                    columnWidths: {
                      1: const FixedColumnWidth(20),
                      data[0].length - 1: const IntrinsicColumnWidth()
                    },
                    border: TableBorder.all(style: BorderStyle.none),
                    children: data
                        .map((row) => TableRow(
                            children: row
                                .map((cell) => TableCell(
                                        child: Text(
                                      cell,
                                      overflow: TextOverflow.ellipsis,
                                    )))
                                .toList()))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
