import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:get/get.dart';

class DetailLaporanHarianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLaporanHarianController>(
      () => DetailLaporanHarianController(),
    );
  }
}