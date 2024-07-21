import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLaporanHarianController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCurrentLaporanHarian();
    });
  }

  Future<void> refresh() async {
    showCurrentLaporanHarian();
  }

  Future showCurrentLaporanHarian() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value);
    DateTime parsedDate = DateTime.parse(formattedDate);
    try {
      isLoading(true);
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
