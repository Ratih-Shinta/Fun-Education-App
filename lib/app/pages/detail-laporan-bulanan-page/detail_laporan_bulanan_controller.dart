import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/service/show_current_laporan_bulanan_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class DetailLaporanBulananController extends GetxController {
  RxInt selectedMonth = 0.obs;
  LaporanBulananService laporanBulananService = LaporanBulananService();
  ShowCurrentLaporanBulananResponse? showCurrentLaporanBulananResponse;
  Rx<ShowCurrentLaporanBulananModel> showCurrentLaporanBulananModel =
      ShowCurrentLaporanBulananModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  showCurrentDetailLaporanBulanan() async {
    Get.toNamed(Routes.DETAIL_LAPORAN_BULANAN_PAGE);
    try {
      isLoading(true);
      showCurrentLaporanBulananModel.value = ShowCurrentLaporanBulananModel();
      await Future.delayed(Duration.zero);
      final response = await laporanBulananService
          .getShowCurrentLaporanBulanan(selectedMonth.value);
      showCurrentLaporanBulananResponse =
          ShowCurrentLaporanBulananResponse.fromJson(response.data);
      showCurrentLaporanBulananModel.value =
          showCurrentLaporanBulananResponse!.data;
      print(showCurrentLaporanBulananModel.value);
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
