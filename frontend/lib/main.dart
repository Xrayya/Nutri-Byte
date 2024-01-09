import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutri_byte/app/core/theme/theme_data.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Nutri Byte",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: NutriByteTheme.lightTheme,
      darkTheme: NutriByteTheme.darkTheme,
      themeMode: ThemeMode.light
    ),
  );
}
