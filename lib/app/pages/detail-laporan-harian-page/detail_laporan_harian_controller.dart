import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/laporan_harian_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailLaporanHarianController extends GetxController {
  RxBool isLoading = false.obs;
  RefreshController refreshController = RefreshController();

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;

  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  RxString userPermission = ''.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = Get.arguments['dateHome'] ??
        Get.arguments['dateLaporan'] ??
        Get.arguments['dateRiwayat'] ??
        Get.arguments['dateRiwayatHadir'];
    showCurrentLaporanHarian(selectedDate.value);
  }

  Future showCurrentLaporanHarian(DateTime? date) async {
    isLoading(true);
    if (date == null) {
      print('Error: date parameter is null');
      return;
    }

    try {
      showCurrentLaporanHarianModel.clear();
      userGrade.value = 0;
      userNote.value = '';
      userPermission.value = '';

      final response = await laporanHarianService.getShowCurrentLaporanHarian(
          '${DateFormat('yyyy-MM-dd').format(date)}');
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;
      userGrade.value = showCurrentLaporanHarianResponse!.totalPoint;
      userNote.value = showCurrentLaporanHarianResponse!.note ?? '';
      userPermission.value = showCurrentLaporanHarianResponse!.permission;

      update();
      isLoading(false);
    } catch (e) {
      print('laporan error :  $e');
      isLoading(false);
    }
  }
}
