import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_response.dart';
import 'package:fun_education_app/app/api/alur-belajar/service/show_current_alur_belajar_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-bulanan/show_current_point_bulanan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-point-mingguan/show_current_point_mingguan_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/laporan_harian_service.dart';
import 'package:fun_education_app/app/api/leaderboard/leaderboard_service.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_model.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_response.dart';
import 'package:fun_education_app/app/api/statistic/models/show_statistic_bottom_tile_model.dart';
import 'package:fun_education_app/app/api/statistic/models/show_statistic_current_model.dart';
import 'package:fun_education_app/app/api/statistic/models/show_statistic_current_response.dart';
import 'package:fun_education_app/app/api/statistic/service/statistic_service.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_response.dart';
import 'package:fun_education_app/app/api/tugas/service/tugas_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LaporanPageController extends GetxController
    with SingleGetTickerProviderMixin {
  RefreshController refreshController = RefreshController();
  RefreshController peringkatRefreshController = RefreshController();
  TabController? tabControllerAll;
  RxBool isLoading = true.obs;
  final Duration animDuration = const Duration(milliseconds: 250);
  RxInt touchedIndex = (-1).obs;
  var currentStatus = 'Tersedia'.obs;

  var spots = <FlSpot>[].obs;
  var touchedTitle = <DateTime>[].obs;
  var bottomTitles = <String?>[].obs;
  
  var maxX = 0.0.obs;

  // var selectedPoint = '5'.obs;
  var selectedPoint = 'weekly'.obs;

  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  RxString userPermission = ''.obs;

  StatisticService statisticService = StatisticService();
  ShowStatisticCurrentResponse? showStatisticCurrentResponse;
  RxList<ShowStatisticCurrentModel> showStatisticCurrentModel =
      <ShowStatisticCurrentModel>[].obs;
  RxList<ShowStatisticBottomTitleModel> showStatisticBottomTitleModel =
      <ShowStatisticBottomTitleModel>[].obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;

  AlurBelajarService alurBelajarService = AlurBelajarService();
  ShowCurrentAlurBelajarResponse? showCurrentAlurBelajarResponse;
  Rx<ShowCurrentAlurBelajarModel> showCurrentAlurBelajarModel =
      ShowCurrentAlurBelajarModel().obs;

  ShowCurrentPointMingguanResponse? showCurrentPointMingguanResponse;
  Rx<ShowCurrentPointMingguanModel> showCurrentPointMingguanModel =
      ShowCurrentPointMingguanModel().obs;

  ShowCurrentPointBulananResponse? showCurrentPointBulananResponse;
  Rx<ShowCurrentPointBulananModel> showCurrentPointBulananModel =
      ShowCurrentPointBulananModel().obs;

  TugasService tugasService = TugasService();
  ShowCurrentTugasResponse? showCurrentTugasResponse;
  RxList<ShowCurrentTugasModel> showCurrentTugasModelTerbaru =
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
    tabControllerAll = TabController(length: 3, vsync: this);
    showCurrentAlurBelajar();
    showCurrentPointMingguan();
    showCurrentPointBulanan();
    showCurrentTugasTerbaru();
    showCurrentTugasDiperiksa();
    showCurrentTugasSelesai();
    showLeaderboardWeelky();
    showLeaderboardMonthly();
    showCurrentLaporanHarian(selectedDate.value);
    showStatisticCurrentLaporanUser();
    update();
    super.onInit();
  }

  Future showStatisticCurrentLaporanUser() async {
    try {
      bottomTitles.clear();
      final response = await statisticService.getStatisticCurrentLaporan(
        selectedPoint.value,
      );
      showStatisticCurrentResponse =
          ShowStatisticCurrentResponse.fromJson(response.data);
      showStatisticCurrentModel.value = showStatisticCurrentResponse!.data;
      print(showStatisticCurrentModel);

      spots.value = showStatisticCurrentModel
          .map((e) => FlSpot(
                showStatisticCurrentModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitle.value =
          showStatisticCurrentModel.map((e) => e.date!).toList();

      bottomTitles.value =
          List<String?>.generate(spots.length, (index) => null);
          
      for (var title in showStatisticCurrentResponse!.bottomTitle) {
        bottomTitles[title.bottomTitleCase!] = title.date.toString();
      }

      maxX.value = spots.length - 1.0;
      isLoading(false);
      update();
    } catch (e) {
      print('statistik error : $e');
    }
  }

  Future showCurrentLaporanHarian(DateTime date) async {
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

  Future showCurrentTugasTerbaru() async {
    try {
      final response = await tugasService.getCurrentTugasTerbaru();
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelTerbaru.value = showCurrentTugasResponse!.data;
      isLoading.value = false;
      print('current tugas Terbaru : ${showCurrentTugasModelTerbaru.length}');
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showCurrentTugasDiperiksa() async {
    try {
      final response = await tugasService.getCurrentTugasDiperiksa();
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelDiperiksa.value = showCurrentTugasResponse!.data;
      isLoading.value = false;
      print(
          'current tugas diperiksa : ${showCurrentTugasModelDiperiksa.length}');
      update();
    } catch (e) {
      print(e);
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
      print(e);
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

  List<DateTime> generateDates() {
    List<DateTime> dates = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 10; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    return dates;
  }

  var currentIndex = 0.obs;
  void changeTab(int index) {
    currentIndex.value = index;
  }

  var selectedTime = 'Mingguan'.obs;
  void setSelectedTime(String time) {
    selectedTime.value = time;
  }

  var selectedPeriod = 'Mingguan'.obs;
  void setSelectedPeriod(String period) {
    selectedPeriod.value = period;
  }

  var selectedDate = DateTime.now().obs;
  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    DateFormat('yyyy-MM-dd').format(selectedDate.value);
    isLoading(true);
    showCurrentLaporanHarian(selectedDate.value);
    // LaporanPageComponentTwo();
    print(selectedDate.value);
    update();
  }
}
