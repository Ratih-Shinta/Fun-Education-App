import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/firebase_api.dart';
import 'package:fun_education_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();

  await initializeDateFormatting('id_ID', null);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
