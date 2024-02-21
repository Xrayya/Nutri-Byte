import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/core/utils/color_utils.dart';
import 'package:nutri_byte/app/widgets/nutribyte_back_button.dart';
import 'package:nutri_byte/app/widgets/nutribyte_button.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                            backgroundImage:
                                const AssetImage('assets/images/dummy_pp.png'),
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
                                  borderRadius: BorderRadius.circular(12),
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
                        style: Get.textTheme.bodyLarge!
                            .copyWith(color: Get.theme.colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // TODO: fill with user info
                      EditProfileTextField(
                        label: "Email",
                        controller: controller.emailController,
                      ),
                      EditProfileTextField(
                        label: "Username",
                        controller: controller.usernameController,
                      ),
                      EditProfileTextField(
                        label: "Gender",
                        controller: controller.genderController,
                      ),
                      EditProfileTextField(
                        label: "Date of Birth",
                        controller: controller.DOBController,
                      ),
                      EditProfileTextField(
                        label: "Height",
                        controller: controller.heightController,
                      ),
                      EditProfileTextField(
                        label: "Weight",
                        controller: controller.weightController,
                      ),
                      EditProfileTextField(
                        label: "Goals",
                        controller: controller.goalsController,
                      ),
                      EditProfileTextField(
                        label: "Activity",
                        controller: controller.activityController,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    this.controller,
    this.onTap,
    this.label,
  });

  final TextEditingController? controller;
  final VoidCallback? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(16),
          alignLabelWithHint: true,
          focusColor: NutriByteColor.light.primary,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: NutriByteColor.light.outline, width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: NutriByteColor.light.primary, width: 3),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red, width: 3),
          ),
        ),
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: this.label,
          suffixIcon: Icon(Icons.mode_edit_outlined),
          suffixIconColor: Get.theme.colorScheme.primary,
        ),
        onTap: this.onTap,
        controller: this.controller,
      ),
    );
  }
}
