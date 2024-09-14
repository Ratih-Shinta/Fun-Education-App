import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_model.dart';
import 'package:fun_education_app/app/api/alur-belajar/models/show_current_alur_belajar_response.dart';
import 'package:fun_education_app/app/api/alur-belajar/show_current_alur_belajar_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/laporan_harian_service.dart';
import 'package:fun_education_app/app/api/leaderboard/leaderboard_service.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_model.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-leaderboard/leaderboard_response.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-report-model/statistic_report_model.dart';
import 'package:fun_education_app/app/api/statistic/models/statistic-report-model/statistic_report_response.dart';
import 'package:fun_education_app/app/api/statistic/statistic_service.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_response.dart';
import 'package:fun_education_app/app/api/tugas/tugas_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LaporanPageController extends GetxController
    with SingleGetTickerProviderMixin {
  RefreshController refreshController = RefreshController();
  RefreshController peringkatRefreshController = RefreshController();

  TabController? tabControllerAll;
  RxBool isLoadingReport = false.obs;
  RxBool isLoadingLearningFlow = false.obs;
  RxBool isLoadingTask = false.obs;
  RxBool isLoadingStatistic = false.obs;
  RxBool isLoadingLeaderboard = false.obs;

  final Duration animDuration = const Duration(milliseconds: 250);
  RxInt touchedIndex = (-1).obs;
  var currentStatus = 'Tersedia'.obs;

  var spots = <FlSpot>[].obs;
  var touchedTitle = <DateTime>[].obs;
  var bottomTitles = <String?>[].obs;
  var bottomTitlesMonthly = <String?>[].obs;

  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  RxString userPermission = ''.obs;

  var maxX = 0.0.obs;

  // var selectedPoint = '5'.obs;
  var selectedPoint = 'weekly'.obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;

  StatisticService statisticService = StatisticService();
  StatisticReportResponse? statisticReportResponse;
  RxList<StatisticReportModel> statisticReportModel =
      <StatisticReportModel>[].obs;

  AlurBelajarService alurBelajarService = AlurBelajarService();
  ShowCurrentAlurBelajarResponse? showCurrentAlurBelajarResponse;
  Rx<ShowCurrentAlurBelajarModel> showCurrentAlurBelajarModel =
      ShowCurrentAlurBelajarModel().obs;

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
    showLeaderboardWeelky();
    showLeaderboardMonthly();
    showStatisticCurrentReport();
    showCurrentTugasTerbaru();
    showCurrentTugasDiperiksa();
    showCurrentTugasSelesai();
    showCurrentLaporanHarian(DateTime.now());
    update();
    super.onInit();
  }

  Future showCurrentLaporanHarian(DateTime? date) async {
    isLoadingReport(true);
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
      isLoadingReport(false);
    } catch (e) {
      print('laporan error :  $e');
      isLoadingReport(false);
    }
  }

  Future showStatisticCurrentReport() async {
    try {
      isLoadingStatistic(true);
      bottomTitles.clear();
      bottomTitlesMonthly.clear();
      final response = await statisticService.getStatisticCurrentLaporan(
        selectedPoint.value,
      );
      statisticReportResponse = StatisticReportResponse.fromJson(response.data);
      statisticReportModel.value = statisticReportResponse!.data;

      spots.value = statisticReportModel
          .map((e) => FlSpot(
                statisticReportModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitle.value = statisticReportModel.map((e) => e.date!).toList();

      bottomTitles.value =
          List<String?>.generate(spots.length, (index) => null);
      bottomTitlesMonthly.value =
          List<String?>.generate(spots.length, (index) => null);

      for (var title in statisticReportResponse!.bottomTitle) {
        bottomTitles[title.bottomTitleCase!] =
            convertToIndonesianDayAbbreviation(title.date!);
        bottomTitlesMonthly[title.bottomTitleCase!] =
            DateFormat('dd-MM').format(title.date!);
      }

      maxX.value = spots.length - 1.0;

      update();
      isLoadingStatistic(false);
    } catch (e) {
      isLoadingStatistic(false);

      print(e);
    }
  }

  String convertToIndonesianDayAbbreviation(DateTime dateTime) {
    String dayInEnglish = DateFormat('EEEE').format(dateTime);

    switch (dayInEnglish) {
      case 'Monday':
        return 'SEN';
      case 'Tuesday':
        return 'SEL';
      case 'Wednesday':
        return 'RAB';
      case 'Thursday':
        return 'KAM';
      case 'Friday':
        return 'JUM';
      case 'Saturday':
        return 'SAB';
      case 'Sunday':
        return 'MIN';
      default:
        return '';
    }
  }

  Future showCurrentTugasTerbaru() async {
    try {
      isLoadingTask(true);
      final response = await tugasService.getCurrentTugas('Terbaru');
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelTerbaru.value = showCurrentTugasResponse!.data;
      print(
          'current tugas terbaru : ${showCurrentTugasModelTerbaru[1].description}');
      isLoadingTask(false);
      update();
    } catch (e) {
      isLoadingTask(false);
      print(e);
    }
  }

  Future showCurrentTugasDiperiksa() async {
    try {
      isLoadingTask(true);
      final response = await tugasService.getCurrentTugas('Diperiksa');
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelDiperiksa.value = showCurrentTugasResponse!.data;
      print(
          'current tugas selesai : ${showCurrentTugasModelDiperiksa[1].description}');
      isLoadingTask(false);
      update();
    } catch (e) {
      isLoadingTask(false);
      print(e);
    }
  }

  Future showCurrentTugasSelesai() async {
    try {
      isLoadingTask(true);
      final response = await tugasService.getCurrentTugas('Selesai');
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModelSelesai.value = showCurrentTugasResponse!.data;
      print(
          'current tugas selesai : ${showCurrentTugasModelSelesai[1].description}');
      isLoadingTask(false);
      update();
    } catch (e) {
      isLoadingTask(false);
      print(e);
    }
  }

  Future showCurrentAlurBelajar() async {
    try {
      isLoadingLearningFlow(true);
      final response = await alurBelajarService.getShowCurrentAlurBelajar();
      showCurrentAlurBelajarResponse =
          ShowCurrentAlurBelajarResponse.fromJson(response.data);
      showCurrentAlurBelajarModel.value = showCurrentAlurBelajarResponse!.data;
      print(showCurrentAlurBelajarModel.value.toJson());
      update();
      isLoadingLearningFlow(false);
    } catch (e) {
      isLoadingLearningFlow(false);
      print(e);
    }
  }

  Future showLeaderboardWeelky() async {
    try {
      isLoadingLeaderboard(true);
      final response = await leaderboardService.getLeaderboardWeekly();
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardModelWeekly.value = leaderboardResponse!.data;
      isLoadingLeaderboard(false);
      update();
      print('leaderboard weelky: ${leaderboardModelWeekly[3].rank}');
    } catch (e) {
      isLoadingLeaderboard(false);
      print(e);
    } finally {
      isLoadingLeaderboard(false);
    }
  }

  Future showLeaderboardMonthly() async {
    try {
      isLoadingLeaderboard(true);
      final response = await leaderboardService.getLeaderboardMonthly();
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardModelMonthly.value = leaderboardResponse!.data;
      isLoadingLeaderboard(false);
      update();
      print('leaderboard monthly: ${leaderboardModelMonthly[3].rank}');
    } catch (e) {
      isLoadingLeaderboard(false);
      print(e);
    } finally {
      isLoadingLeaderboard(false);
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

  var selectedPeriod = 'weekly'.obs;
  void setSelectedPeriod(String period) {
    selectedPeriod.value = period;
  }

  var selectedDate = DateTime.now().obs;
  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
    DateFormat('yyyy-MM-dd').format(selectedDate.value);
    isLoadingReport(true);
    showCurrentLaporanHarian(selectedDate.value);
    print(selectedDate.value);
    update();
  }
}
