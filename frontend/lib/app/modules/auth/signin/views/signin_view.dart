import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/nutribyte.svg',
            width: context.width * 0.45,
            height: context.width * 0.45,
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 48),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: Get.textTheme.displaySmall!
                        .copyWith(color: Get.theme.colorScheme.surfaceTint),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: controller.emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationBuilder()
                        .email('Please input a valid email')
                        .build(),
                    decoration: const InputDecoration(
                        hintText: 'Email address', labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: ValidationBuilder()
                          .minLength(
                              8, 'Password length must be greatest than 8 char')
                          .build(),
                      obscureText: controller.passwordObscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.passwordObscureText.toggle(),
                          icon: Icon(controller.passwordObscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordConfirmEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: ValidationBuilder()
                          .minLength(
                              8, 'Password length must be greatest than 8 char')
                          .build(),
                      obscureText: controller.passwordConfirmObscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Password Verification',
                        labelText: 'Password Verification',
                        suffixIcon: IconButton(
                          onPressed: () =>
                              controller.passwordConfirmObscureText.toggle(),
                          icon: Icon(controller.passwordConfirmObscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: controller.isAgreed.value,
                      onChanged: (value) => controller.isAgreed.toggle(),
                      title: RichText(
                        text: TextSpan(
                          style: Get.textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: 'Do you agree to our',
                              style: TextStyle(
                                  color: Get.theme.colorScheme.surfaceTint),
                            ),
                            TextSpan(
                              text: ' Terms of Service ',
                              style: TextStyle(color: NutriByteColor.primary70),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                  color: Get.theme.colorScheme.surfaceTint),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: NutriByteColor.primary70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.register(),
                      child: Text(
                        'Sign Up',
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Get.textTheme.bodyMedium!
                            .copyWith(color: Get.theme.colorScheme.surfaceTint),
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.LOGIN),
                        child: Text(
                          'Log In',
                          style: Get.textTheme.bodyMedium!
                              .copyWith(color: NutriByteColor.primary70),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
