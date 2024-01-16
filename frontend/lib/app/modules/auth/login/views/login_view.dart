import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';
import 'package:nutri_byte/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                    'Log in',
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
                        hintText: 'Email', labelText: 'Email'),
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
                      obscureText: controller.obscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureText.toggle(),
                          icon: Icon(controller.obscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.login(),
                      child: Text(
                        'Log In',
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: NutriByteColor.darkText,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'or sign in using',
                        style: TextStyle(
                            color: NutriByteColor.darkText, fontSize: 14),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                          child: Divider(
                        color: NutriByteColor.darkText,
                        height: 1,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () => controller.loginWithGoogle(),
                      shape: const CircleBorder(side: BorderSide.none),
                      child: SvgPicture.asset(
                        'assets/images/circle_google.svg',
                        width: 48,
                        height: 48,
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
                        "Don't have an account?",
                        style: Get.textTheme.bodyMedium!
                            .copyWith(color: Get.theme.colorScheme.surfaceTint),
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.SIGNIN),
                        child: Text(
                          'Sign Up',
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
