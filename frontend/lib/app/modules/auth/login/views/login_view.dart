import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/nutribyte.svg',
            width: context.width * 0.3,
            height: context.width * 0.3,
          ),
          SizedBox(
            height: 55,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 48),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Log in',
                    style: Get.textTheme.displaySmall!
                        .copyWith(color: Get.theme.colorScheme.surfaceTint),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(hintText: 'Email', labelText: 'Email'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: NutriByteColor.primary70,
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text(
                        'Log In',
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: NutriByteColor.darkText,
                        height: 1,
                      )),
                      Text(
                        'or sign in using',
                        style: TextStyle(
                            color: NutriByteColor.darkText, fontSize: 14),
                      ),
                      Expanded(
                          child: Divider(
                        color: NutriByteColor.darkText,
                        height: 1,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'assets/images/circle_google.svg',
                      width: 48,
                      height: 48,
                    ),
                    shape: CircleBorder(side: BorderSide.none),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Get.textTheme.bodyMedium!
                            .copyWith(color: Get.theme.colorScheme.surfaceTint),
                      ),
                      TextButton(
                        onPressed: () {},
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
