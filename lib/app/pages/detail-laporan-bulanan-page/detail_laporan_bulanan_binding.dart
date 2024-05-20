import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_controller.dart';
import 'package:get/get.dart';

class DetailLaporanBulananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLaporanBulananController>(
      () => DetailLaporanBulananController(),
    );
  }
}