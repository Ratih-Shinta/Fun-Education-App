import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/service/show_current_laporan_bulanan_service.dart';
import 'package:get/get.dart';

class LaporanPageController extends GetxController {
  RxBool isLoading = false.obs;

  LaporanBulananService laporanHarianService = LaporanBulananService();
  ShowCurrentLaporanBulananResponse? showCurrentLaporanBulananResponse;
  Rx<ShowCurrentLaporanBulananModel> showCurrentLaporanBulananModel =
      ShowCurrentLaporanBulananModel().obs;

  @override
  void onInit() {
    showCurrentLaporanBulanan();
    super.onInit();
  }

  showCurrentLaporanBulanan() async {
    try {
      isLoading(true);
      await Future.delayed(Duration.zero);
      final response = await laporanHarianService
          .getShowCurrentLaporanBulanan(DateTime.now().month);
      showCurrentLaporanBulananResponse =
          ShowCurrentLaporanBulananResponse.fromJson(response.data);
      showCurrentLaporanBulananModel.value =
          showCurrentLaporanBulananResponse!.data;
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
