import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/navbar/navbar_main_controller.dart';

class NavbarMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarMainController>(() => NavbarMainController());
  }
}