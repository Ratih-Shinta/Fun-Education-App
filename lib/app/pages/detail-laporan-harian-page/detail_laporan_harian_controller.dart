import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLaporanHarianController extends GetxController {
  RxBool isLoading = false.obs;
}
