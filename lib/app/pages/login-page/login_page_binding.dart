import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}