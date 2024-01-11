import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/theme_data.dart';
import 'package:nutri_byte/app/modules/auth/controllers/auth_controller.dart';
import 'package:nutri_byte/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(
    GetMaterialApp(
        title: "Nutri Byte",
        initialRoute: Routes.AUTH,
        getPages: AppPages.routes,
        theme: NutriByteTheme.lightTheme,
        darkTheme: NutriByteTheme.darkTheme,
        themeMode: ThemeMode.light),
  );
}
