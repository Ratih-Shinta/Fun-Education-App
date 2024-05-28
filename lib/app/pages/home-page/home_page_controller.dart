import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_model.dart';
import 'package:fun_education_app/app/api/catatan-darurat/models/show_latest_catatan_darurat_response.dart';
import 'package:fun_education_app/app/api/catatan-darurat/service/show_latest_catatan_darurat_service.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_model.dart';
import 'package:fun_education_app/app/api/laporan-harian/models/show_current_laporan_harian_response.dart';
import 'package:fun_education_app/app/api/laporan-harian/service/show_current_laporan_harian_service.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_response.dart';
import 'package:fun_education_app/app/api/shift-masuk/service/shift_masuk_sevice.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
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

  LaporanHarianService laporanHarianService = LaporanHarianService();
  ShowCurrentLaporanHarianResponse? showCurrentLaporanHarianResponse;
  Rx<ShowCurrentLaporanHarianModel> showCurrentLaporanHarianModel =
      ShowCurrentLaporanHarianModel().obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    showCurrentShiftMasuk();
    showCurrentUser();
    showLatestCatatanDarurat();
    showCurrentLaporanHarian();

    update();
    super.onInit();
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
    } catch (e) {
      print(e);
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
      print('tre');
      update();
    } catch (e) {
      print(e);
    }
  }

  showCurrentLaporanHarian() async {
    try {
      await Future.delayed(Duration.zero);
      final response = await laporanHarianService.getShowCurrentLaporanHarian();
      showCurrentLaporanHarianResponse =
          ShowCurrentLaporanHarianResponse.fromJson(response.data);
      showCurrentLaporanHarianModel.value =
          showCurrentLaporanHarianResponse!.data;
      print('asd');
      update();
    } catch (e) {
      print(e);
    }
  }
}
