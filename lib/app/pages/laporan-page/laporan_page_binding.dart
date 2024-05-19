import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:get/get.dart';

class LaporanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPageController>(
      () => LaporanPageController(),
    );
  }
}
