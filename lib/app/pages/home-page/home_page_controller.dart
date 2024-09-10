import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_model.dart';
import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_response.dart';
import 'package:fun_education_app/app/api/catatan-darurat/show_latest_catatan_darurat_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show-current-laporan-harian/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/laporan_harian_service.dart';
import 'package:fun_education_app/app/api/leaderboard/leaderboard_service.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-total-point/total_point_response.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_response.dart';
import 'package:fun_education_app/app/api/tugas/tugas_service.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/user_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RxBool isLoadingLatestCatatan = false.obs;
  RxBool isLoading = true.obs;

  RxInt totalPoint = 0.obs;

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  RxList<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      <ShowCurrentLaporanHarianModel>[].obs;

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  CatatanDaruratService catatanDaruratService = CatatanDaruratService();
  ShowLatestCatatanDaruratResponse? showLatestCatatanDaruratResponse;
  Rx<ShowLatestCatatanDaruratModel> showLatestCatatanDaruratModel =
      ShowLatestCatatanDaruratModel().obs;

  LeaderboardService leaderboardService = LeaderboardService();
  Rx<ShowTotalPointResponse> showTotalPointModel =
      ShowTotalPointResponse(point: '0').obs;

  TugasService tugasService = TugasService();
  ShowCurrentTugasResponse? showCurrentTugasResponse;
  RxList<ShowCurrentTugasModel> showCurrentTugasModel =
      <ShowCurrentTugasModel>[].obs;
  RxList<ShowCurrentTugasImageModel> showCurrentTugasImageModel =
      <ShowCurrentTugasImageModel>[].obs;

  @override
  void onInit() {
    showCurrentUser();
    showLatestCatatanDarurat();
    showTotalPoint();
    showCurrentTugas();
    showCurrentLaporanHarian();

    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future showCurrentLaporanHarian() async {
    try {
      final response = await laporanHarianService.getShowCurrentLaporanHarian(
          '${DateFormat('yyyy-MM-dd').format(DateTime.now())}');
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;
      totalPoint.value = showCurrentLaporanHarianResponse!.totalPoint;
      update();
      print(
          'laporan total point : ${showCurrentLaporanHarianResponse?.totalPoint}');
      isLoading(false);
    } catch (e) {
      print('laporan error :  $e');
    }
  }

  Future showCurrentTugas() async {
    try {
      final response = await tugasService.getCurrentTugas('Terbaru');
      showCurrentTugasResponse =
          ShowCurrentTugasResponse.fromJson(response.data);
      showCurrentTugasModel.value = showCurrentTugasResponse!.data;
      isLoading.value = false;
      print('current tugas ${showCurrentTugasModel.length}');
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showTotalPoint() async {
    try {
      final response = await leaderboardService.getTotalPoint();
      final totalPointResponse = ShowTotalPointResponse.fromJson(response.data);
      showTotalPointModel.value = totalPointResponse;
      isLoading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showCurrentUser() async {
    try {
      final response = await userService.getShowCurrentUser();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
      isLoading.value = false;
      update();
      print('showCurrentUserModel : ${showCurrentUserModel.value.nickname}');
    } catch (e) {
      print('showCurrentUserModel $e');
    }
  }

  Future showLatestCatatanDarurat() async {
    try {
      final response =
          await catatanDaruratService.getShowLatestCatatanDarurat();
      showLatestCatatanDaruratResponse =
          ShowLatestCatatanDaruratResponse.fromJson(response.data);
      showLatestCatatanDaruratModel.value =
          showLatestCatatanDaruratResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
