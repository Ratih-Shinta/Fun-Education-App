import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}