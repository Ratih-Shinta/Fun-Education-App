import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/hal_yang_perlu_diperhatikan_controller.dart';

class HalYangPerluDiperhatikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalYangPerluDiperhatikanController>(
      () => HalYangPerluDiperhatikanController(),
    );
  }
}