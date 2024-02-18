import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () => Get.back(),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 145, 24, 96),
              child: Column(children: [
                Text(
                  "Verification",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF294B19)),
                ),
                Obx(
                  () => Text(
                    "Verification status: ${controller.isVerfied}",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: Color(0xFF446832),
                    ),
                  ),
                ),
                Text(
                  "Please click the verification link to in you email",
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Color(0xFF446832),
                  ),
                ),
                SizedBox(height: 68),
                Text(
                  "Didn't get the verification link?",
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Color(0xFF446832),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    'Resend Verification Link',
                    style:
                        Get.textTheme.titleLarge!.copyWith(color: Colors.white),
                  ),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
