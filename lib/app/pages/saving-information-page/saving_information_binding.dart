import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/saving-information-page/saving_information_controller.dart';

class SavingInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavingInformationController>(() => SavingInformationController());
  }
}