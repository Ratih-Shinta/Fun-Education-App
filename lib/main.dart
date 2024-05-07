import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}