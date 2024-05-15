import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_controller.dart';

class SavingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingController>(() => SavingController());
  }
}
