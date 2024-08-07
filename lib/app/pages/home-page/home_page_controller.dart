import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_model.dart';
import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_response.dart';
import 'package:fun_education_app/app/api/catatan-darurat/service/show_latest_catatan_darurat_service.dart';
import 'package:fun_education_app/app/api/leaderboard/leaderboard_service.dart';
import 'package:fun_education_app/app/api/leaderboard/models/show-total-point/total_point_response.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_response.dart';
import 'package:fun_education_app/app/api/shift-masuk/service/shift_masuk_sevice.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_response.dart';
import 'package:fun_education_app/app/api/tugas/service/tugas_service.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isLoadingLatestCatatan = false.obs;

  ShiftMasukService shiftMasukService = ShiftMasukService();
  ShiftMasukResponse? shiftMasukResponse;
  Rx<ShiftMasukModel> shiftMasukModel = ShiftMasukModel().obs;

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  CatatanDaruratService catatanDaruratService = CatatanDaruratService();
  ShowLatestCatatanDaruratResponse? showLatestCatatanDaruratResponse;
  Rx<ShowLatestCatatanDaruratModel> showLatestCatatanDaruratModel =
      ShowLatestCatatanDaruratModel().obs;

  LeaderboardService leaderboardService = LeaderboardService();
  Rx<ShowTotalPointResponse> showTotalPointModel = ShowTotalPointResponse(point: '0').obs;
  
    TugasService tugasService = TugasService();
  ShowCurrentTugasResponse? showCurrentTugasResponse;
  RxList<ShowCurrentTugasModel> showCurrentTugasModel =
      <ShowCurrentTugasModel>[].obs;
        RxList<ShowCurrentTugasImageModel> showCurrentTugasImageModel =
      <ShowCurrentTugasImageModel>[].obs;



  RxBool isLoading = true.obs;

  @override
  void onInit() {
    showCurrentShiftMasuk();
    showCurrentUser();
    showLatestCatatanDarurat();
    showTotalPoint();
    showCurrentTugas();
    update();
    super.onInit();
  }

  Future showCurrentTugas() async {
    try {
      final response = await tugasService.getCurrentTugas();
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


  Future showCurrentShiftMasuk() async {
    try {
      final response = await shiftMasukService.getCurrentShiftMasuk();
      shiftMasukResponse = ShiftMasukResponse.fromJson(response.data);
      shiftMasukModel.value = shiftMasukResponse!.data;
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
      print(showCurrentUserModel.value.nickname);
    } catch (e) {
      print(e);
    }
  }

  Future showLatestCatatanDarurat() async {
    try {
      isLoadingLatestCatatan(true);
      final response = await catatanDaruratService.getShowLatestCatatanDarurat();
      showLatestCatatanDaruratResponse = ShowLatestCatatanDaruratResponse.fromJson(response.data);
      showLatestCatatanDaruratModel.value = showLatestCatatanDaruratResponse!.data;
      update();
    } catch (e) {
      isLoadingLatestCatatan(true);
      print(e);
    } finally {
      isLoadingLatestCatatan(false);
    }
  }

  
}
