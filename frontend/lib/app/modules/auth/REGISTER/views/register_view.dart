import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';
import 'package:nutri_byte/app/core/values/strings.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  Future<void> next() async {
    await Future.delayed(Duration(milliseconds: 300));
    if (controller.index.value <= 8) {
      controller.index.value++;
    }
    if (controller.index.value == 9) {
      print('runn');
      controller.register();
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void back() {
    if (controller.index.value > 1) {
      controller.index.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: FloatingActionButton(
                  onPressed: () => back(), child: const Icon(Icons.arrow_back)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    Obx(
                      () => Text(
                        '${controller.index.value} of 9',
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    Obx(
                      () => GradientProgressIndicator([
                        Color(0xFFC4EFAC),
                        Color(0xFF8EDF81),
                        Color(0xFF7CBC71),
                      ], controller.index.value / 9.0),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: Obx(
                        () => controller.index.value == 1
                            ? stepOne()
                            : controller.index.value == 2
                                ? stepName(context)
                                : controller.index.value == 3
                                    ? stepTwo(context)
                                    : controller.index.value == 4
                                        ? stepThree()
                                        : controller.index.value == 5
                                            ? stepFour()
                                            : controller.index.value == 6
                                                ? stepFive()
                                                : controller.index.value == 7
                                                    ? stepSix()
                                                    : controller.index.value ==
                                                            8
                                                        ? stepSeven()
                                                        : const Text(
                                                            "Let's get started",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF14304A),
                                                                fontSize: 32,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column stepSeven() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight Gain',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Obx(
                    () => ChoiceListTile(
                      isSelected: controller.weightGain.value == index + 1,
                      title: weightGainList[index],
                      onTap: () async {
                        controller.weightGain(index + 1);
                        await next();
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: weightGainList.length),
        )
      ],
    );
  }

  Column stepSix() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight Loss',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Obx(
                    () => ChoiceListTile(
                      isSelected: controller.weightLoss.value == index + 1,
                      title: weightLossList[index],
                      onTap: () async {
                        controller.weightLoss(index + 1);
                        await next();
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: weightLossList.length),
        )
      ],
    );
  }

  Column stepFive() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Goal',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Obx(
                    () => ChoiceListTile(
                      isSelected: controller.goal.value == index + 1,
                      title: goalList[index],
                      onTap: () async {
                        controller.goal(index + 1);
                        await next();
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: goalList.length),
        )
      ],
    );
  }

  Column stepFour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activity per Week',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Obx(
                    () => ChoiceListTile(
                      isSelected: controller.activity.value == index + 1,
                      title: activityPerWeekList[index],
                      onTap: () async {
                        controller.activity(index + 1);
                        await next();
                      },
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: activityPerWeekList.length),
        )
      ],
    );
  }

  Column stepThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight & Height',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller.weightEditingController,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            controller.weight(int.parse(value));
          },
          decoration: const InputDecoration(
            hintText: 'Weight (kg)',
            labelText: 'Weight (kg)',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller.heightEditingController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Height (cm)',
            labelText: 'Height (cm)',
          ),
          onChanged: (value) {
            controller.height(int.parse(value));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: nutriByteButton(
                text: 'Next',
                onPressed: controller.weight.value != null &&
                        controller.height.value != null
                    ? () => next()
                    : null),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Column stepName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller.nameEditingController,
          keyboardType: TextInputType.name,
          onChanged: (value) {
            controller.name(value);
          },
          decoration: const InputDecoration(
            hintText: 'Name',
            labelText: 'Name',
          ),
        ),
        const Spacer(),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: nutriByteButton(
                text: 'Next',
                onPressed: controller.name.value != null ? () => next() : null),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Column stepTwo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date of Birth',
          style: TextStyle(
              color: Color(0xFF14304A),
              fontSize: 32,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controller.dateEditingController,
          keyboardType: TextInputType.none,
          decoration: const InputDecoration(
            hintText: 'Date of Birth',
            labelText: 'Date of Birth',
          ),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((value) {
              //format to dd/mm/yyyy
              String formattedValue =
                  '${value!.day}/${value.month}/${value.year}';
              controller.birthDate(formattedValue);
              controller.dateEditingController.text = formattedValue;
            });
          },
        ),
        const Spacer(),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: nutriByteButton(
                text: 'Next',
                onPressed:
                    controller.birthDate.value != null ? () => next() : null),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Obx stepOne() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
                color: Color(0xFF14304A),
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          ChoiceListTile(
            isSelected: controller.gender.value == 'Men',
            title: 'Men',
            onTap: () async {
              controller.gender('Men');
              await next();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ChoiceListTile(
            isSelected: controller.gender.value == 'Women',
            title: 'Women',
            onTap: () async {
              controller.gender('Women');
              await next();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ChoiceListTile(
            isSelected: controller.gender.value == 'Prefer not to say',
            title: 'Prefer not to say',
            onTap: () async {
              controller.gender('Prefer not to say');
              await next();
            },
          ),
        ],
      ),
    );
  }
}

class ChoiceListTile extends StatelessWidget {
  const ChoiceListTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });
  final bool isSelected;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 18),
          backgroundColor: isSelected
              ? Get.theme.colorScheme.primaryContainer
              : const Color(0xFFF2F5EA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF43483E),
            ),
          ),
          isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.black,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
