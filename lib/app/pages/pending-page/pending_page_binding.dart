import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/pending-page/pending_page_controller.dart';

class PendingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendingPageController>(() => PendingPageController());
  }
}