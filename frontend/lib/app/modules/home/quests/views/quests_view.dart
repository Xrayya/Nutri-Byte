import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quests_controller.dart';

class QuestsView extends GetView<QuestsController> {
  const QuestsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuestsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuestsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
