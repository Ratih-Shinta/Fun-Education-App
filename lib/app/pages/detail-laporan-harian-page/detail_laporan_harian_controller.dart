import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/show_current_laporan_harian_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class DetailLaporanHarianController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  Rx<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      ShowCurrentLaporanHarianModel().obs;

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting('id_ID', '');
  }

  Future showCurrentLaporanHarian() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value);
    DateTime parsedDate = DateTime.parse(formattedDate);
    Get.toNamed(Routes.DETAIL_LAPORAN_HARIAN_PAGE);
    try {
      isLoading(true);
      showCurrentLaporanHarianModel.value = ShowCurrentLaporanHarianModel();
      final response =
          await laporanHarianService.getShowCurrentLaporanHarian(parsedDate);
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
