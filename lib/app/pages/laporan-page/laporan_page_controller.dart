import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_response.dart';
import 'package:fun_education_app/app/api/alur-belajar/service/show_current_alur_belajar_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:fun_education_app/app/api/leaderboard/leaderboard_service.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_model.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_response.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_response.dart';
import 'package:fun_education_app/app/api/tugas/service/tugas_service.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:get/get.dart';

class LaporanPageController extends GetxController {
  HomePageController homePageController = Get.put(HomePageController());
  RxBool isLoading = false.obs;
  RxBool isLoadingLaporanHarian = false.obs;
  final Duration animDuration = const Duration(milliseconds: 250);
  RxInt touchedIndex = (-1).obs;
  var currentStatus = 'Tersedia'.obs;

  AlurBelajarService alurBelajarService = AlurBelajarService();
  ShowCurrentAlurBelajarResponse? showCurrentAlurBelajarResponse;
  Rx<ShowCurrentAlurBelajarModel> showCurrentAlurBelajarModel =
      ShowCurrentAlurBelajarModel().obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentPointMingguanResponse? showCurrentPointMingguanResponse;
  Rx<ShowCurrentPointMingguanModel> showCurrentPointMingguanModel =
      ShowCurrentPointMingguanModel().obs;

  ShowCurrentPointBulananResponse? showCurrentPointBulananResponse;
  Rx<ShowCurrentPointBulananModel> showCurrentPointBulananModel =
      ShowCurrentPointBulananModel().obs;

  TugasService tugasService = TugasService();
  ShowCurrentTugasResponse? showCurrentTugasResponse;
  RxList<ShowCurrentTugasModel> showCurrentTugasModel =
      <ShowCurrentTugasModel>[].obs;
  RxList<ShowCurrentTugasModel> showCurrentTugasModelDiperiksa =
      <ShowCurrentTugasModel>[].obs;
  RxList<ShowCurrentTugasModel> showCurrentTugasModelSelesai =
      <ShowCurrentTugasModel>[].obs;
  RxList<ShowCurrentTugasImageModel> showCurrentTugasImageModel =
      <ShowCurrentTugasImageModel>[].obs;

  LeaderboardService leaderboardService = LeaderboardService();
  LeaderboardResponse? leaderboardResponse;
  RxList<LeaderboardModel> leaderboardModelWeekly = <LeaderboardModel>[].obs;
  RxList<LeaderboardModel> leaderboardModelMonthly = <LeaderboardModel>[].obs;

  @override
  void onInit() {
    showCurrentAlurBelajar();
      showCurrentPointMingguan();
      showCurrentPointBulanan();
      showCurrentTugas();
      showCurrentTugasDiperiksa();
      showCurrentTugasSelesai();
      showLeaderboardWeelky();
      showLeaderboardMonthly();
    super.onInit();
  }

  Future showCurrentTugas() async {
    try {
      isLoading(true);
      final response = await tugasService.getCurrentTugas();
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModel.value = showCurrentTugasResponse!.data;
      isLoading.value = false;
      print('current tugas ${showCurrentTugasModel.length}');
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future showCurrentTugasDiperiksa() async {
    try {
      isLoading(true);
      final response = await tugasService.getCurrentTugasDiperiksa();
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelDiperiksa.value = showCurrentTugasResponse!.data;
      isLoading.value = false;
      print(
          'current tugas diperiksa : ${showCurrentTugasModelDiperiksa.length}');
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future showCurrentTugasSelesai() async {
    try {
      isLoading(true);
      final response = await tugasService.getCurrentTugasSelesai();
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelSelesai.value = showCurrentTugasResponse!.data;
      print(
          'current tugas selesai : ${showCurrentTugasModelSelesai[1].description}');
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future showCurrentAlurBelajar() async {
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

  Future showLeaderboardWeelky() async {
    try {
      isLoading(true);
      final response = await leaderboardService.getLeaderboardWeekly();
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardModelWeekly.value = leaderboardResponse!.data;
      isLoading.value = false;
      update();
      print('leaderboard weelky: ${leaderboardModelWeekly[3].rank}');
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future showLeaderboardMonthly() async {
    try {
      isLoading(true);
      final response = await leaderboardService.getLeaderboardMonthly();
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardModelMonthly.value = leaderboardResponse!.data;
      isLoading.value = false;
      update();
      print('leaderboard monthly: ${leaderboardModelMonthly[3].rank}');
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
  void setSelectedTime(String time) {
    selectedTime.value = time;
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
  }
}
