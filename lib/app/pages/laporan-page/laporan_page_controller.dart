import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_response.dart';
import 'package:fun_education_app/app/api/alur-belajar/service/show_current_alur_belajar_service.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/models/show_current_laporan_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-bulanan/service/show_current_laporan_bulanan_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:get/get.dart';

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
  ShowCurrentPointMingguanResponse? showCurrentPointMingguanResponse;
  Rx<ShowCurrentPointMingguanModel> showCurrentPointMingguanModel =
      ShowCurrentPointMingguanModel().obs;

  ShowCurrentPointBulananResponse? showCurrentPointBulananResponse;
  Rx<ShowCurrentPointBulananModel> showCurrentPointBulananModel =
      ShowCurrentPointBulananModel().obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCurrentAlurBelajar();
      showCurrentLaporanBulanan();
      showCurrentPointMingguan();
      showCurrentPointBulanan();
    });
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

  Future showCurrentPointMingguan() async {
    try {
      isLoading(true);
      final response = await laporanHarianService.getShowCurrentPointMingguan();
      showCurrentPointMingguanResponse =
          ShowCurrentPointMingguanResponse.fromJson(response.data);
      showCurrentPointMingguanModel.value =
          showCurrentPointMingguanResponse!.data;
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future showCurrentPointBulanan() async {
    try {
      isLoading(true);
      final response = await laporanHarianService.getShowCurrentPointBulanan();
      showCurrentPointBulananResponse =
          ShowCurrentPointBulananResponse.fromJson(response.data);
      showCurrentPointBulananModel.value =
          showCurrentPointBulananResponse!.data;
      isLoading.value = false;
      update();
      print(showCurrentPointBulananModel.value.week1Point);
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
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

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  Future<void> refresh() async {
    showCurrentAlurBelajar();
    showCurrentLaporanBulanan();
  }
}
