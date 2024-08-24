import 'package:get/get.dart';
import 'reset_password_page_controller.dart';

class ResetPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordPageController>(() => ResetPasswordPageController());
  }
}