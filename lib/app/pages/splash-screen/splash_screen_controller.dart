import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  Future splashScreen() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAndToNamed(
          Routes.HOME_PAGE,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    splashScreen();
  }
}
