import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models.dart';

import '../controllers/dashboard_controller.dart';

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
      body: Text("dashboard"),
    );
  }
}
