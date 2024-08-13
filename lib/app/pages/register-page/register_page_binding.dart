import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(() => RegisterPageController());
  }
}