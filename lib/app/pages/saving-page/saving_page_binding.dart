import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';

class SavingPageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SavingPageController>(() => SavingPageController());
    Get.put(SavingPageController());
  }
}
