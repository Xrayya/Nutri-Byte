import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  const RewardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RewardsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RewardsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
