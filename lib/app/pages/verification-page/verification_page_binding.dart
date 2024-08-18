import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/verification-page/verification_page_controller.dart';

class VerificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationPageController>(() => VerificationPageController());
  }
}