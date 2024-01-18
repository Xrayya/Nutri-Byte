import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/widgets/nutribyte_back_button.dart';

import '../controllers/quests_controller.dart';

class QuestsView extends GetView<QuestsController> {
  const QuestsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NutriByteBackButton(),
            const Text(
              "Today's Quest",
              style: TextStyle(
                color: Color(0xFF294B19),
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
            ),
            Obx(
              () => Column(
                children: controller.quests
                    .toList()
                    .map((quest) => Card(
                          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          clipBehavior: Clip.hardEdge,
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              quest.title,
                              style: Get.textTheme.titleLarge!.copyWith(
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                            subtitle: Text(
                              "${quest.coin} NutriCoins",
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                            // TODO: find the correct icon
                            trailing: Icon( quest.completed ? Icons.verified_outlined : Icons.radio_button_off_outlined,
                              size: 42,
                            ),
                            tileColor: Get.theme.colorScheme.primaryContainer,
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
