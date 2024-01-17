import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';
import 'package:nutri_byte/app/core/values/strings.dart';
import 'package:nutri_byte/app/widgets/nutribyte_back_button.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/detailprofile_controller.dart';

class DetailprofileView extends GetView<DetailprofileController> {
  const DetailprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.currentUser.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 10),
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
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const NutriByteBackButton(),
                                nutriByteButton(text: 'Edit', onPressed: () {}),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Get.theme.colorScheme.primary.tone(80),
                                    radius: 75,
                                    backgroundImage: const AssetImage(
                                        'assets/images/dummy_pp.png'),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        padding: const EdgeInsets.all(8),
                                        minimumSize: const Size(0, 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        primary: const Color(0xFFE7E9DF),
                                      ),
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: Get.theme.colorScheme.primary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Basic Member',
                                style: Get.textTheme.bodyLarge!.copyWith(
                                    color: Get.theme.colorScheme.primary),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                clipBehavior: Clip.antiAlias,
                                surfaceTintColor: Colors.transparent,
                                elevation: 3,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 30),
                                  child: Row(
                                    children: [
                                      generateTitleList(
                                        <String>[
                                          'Email',
                                          'Name',
                                          'Gender',
                                          'Date of Birth',
                                          'Height',
                                          'Weight',
                                          'Goals',
                                          'Activity',
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      generateTitleList(
                                        <String>[
                                          ':',
                                          ':',
                                          ':',
                                          ':',
                                          ':',
                                          ':',
                                          ':',
                                          ':',
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: generateTitleList(
                                          <String>[
                                            controller.email ?? '',
                                            controller.currentUser.value!.name,
                                            controller
                                                .currentUser.value!.gender,
                                            controller
                                                .currentUser.value!.dateOfBirth,
                                            '${controller.currentUser.value!.height} cm',
                                            '${controller.currentUser.value!.weight} kg',
                                            goalList[controller.currentUser
                                                    .value!.goalType -
                                                1],
                                            activityPerWeekList[controller
                                                        .currentUser
                                                        .value!
                                                        .activityLevel -
                                                    1]
                                                .split(':')[0],
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: nutriByteButton(
                                    elevation: 0,
                                    text: 'Delete Account',
                                    type: NutriByteButtonType.secondary,
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  IntrinsicWidth generateTitleList(List<String> titles) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: titles.map((title) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: Get.theme.colorScheme.primary,
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
