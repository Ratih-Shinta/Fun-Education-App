import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_response.dart';
import 'package:fun_education_app/app/api/alur-belajar/service/show_current_alur_belajar_service.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/service/show_current_laporan_bulanan_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/show_current_laporan_harian_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingLaporanHarian = false.obs;
  final Duration animDuration = const Duration(milliseconds: 250);
  RxInt touchedIndex = (-1).obs;

  AlurBelajarService alurBelajarService = AlurBelajarService();
  ShowCurrentAlurBelajarResponse? showCurrentAlurBelajarResponse;
  Rx<ShowCurrentAlurBelajarModel> showCurrentAlurBelajarModel =
      ShowCurrentAlurBelajarModel().obs;

  LaporanBulananService laporanBulananService = LaporanBulananService();
  ShowCurrentLaporanBulananResponse? showCurrentLaporanBulananResponse;
  Rx<ShowCurrentLaporanBulananModel> showCurrentLaporanBulananModel =
      ShowCurrentLaporanBulananModel().obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  Rx<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      ShowCurrentLaporanHarianModel().obs;

  @override
  void onInit() {
    showCurrentAlurBelajar();
    showCurrentLaporanBulanan();
    showCurrentLaporanHarian();
    super.onInit();
  }

  showCurrentAlurBelajar() async {
    try {
      final response = await alurBelajarService.getShowCurrentAlurBelajar();
      showCurrentAlurBelajarResponse =
          ShowCurrentAlurBelajarResponse.fromJson(response.data);
      showCurrentAlurBelajarModel.value = showCurrentAlurBelajarResponse!.data;
      print(showCurrentAlurBelajarModel.value.toJson());
      update();
    } catch (e) {
      print(e);
    }
  }

  showCurrentLaporanBulanan() async {
    try {
      isLoading(true);
      showCurrentLaporanBulananModel.value = ShowCurrentLaporanBulananModel();
      await Future.delayed(Duration.zero);
      final response = await laporanBulananService
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

  showCurrentLaporanHarian() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    DateTime parsedDate = DateTime.parse(formattedDate);
    try {
      isLoadingLaporanHarian(true);
      showCurrentLaporanHarianModel.value = ShowCurrentLaporanHarianModel();
      final response =
          await laporanHarianService.getShowCurrentLaporanHarian(parsedDate);
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;

      update();
    } catch (e) {
      isLoadingLaporanHarian(true);
      print(e);
    } finally {
      isLoadingLaporanHarian(false);
    }
  }

  void onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity != null) {
      if (details.primaryVelocity! < 0) {
        // swiped left
        if (currentIndex.value < 1) {
          changeTab(currentIndex.value + 1);
        }
      } else if (details.primaryVelocity! > 0) {
        // swiped right
        if (currentIndex.value > 0) {
          changeTab(currentIndex.value - 1);
        }
      }
    }
  }

  List<DateTime> generateDates() {
    List<DateTime> dates = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 10; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    return dates;
  }

  var selectedDate = DateTime.now().obs;
  void changeDate(DateTime date) {
    selectedDate.value = date;
  }

  var currentIndex = 0.obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }

  var selectedStatus = 0.obs;
  final List<int> counts = [12, 3, 10];
  void changeStatus(int index) {
    selectedStatus.value = index;
  }

  var selectedTime = 'Mingguan'.obs;
  void setSelectedTime(String period) {
    selectedTime.value = period;
  }

  var selectedPeriod = 'Mingguan'.obs;
  void setSelectedPeriod(String period) {
    selectedPeriod.value = period;
  }
}
