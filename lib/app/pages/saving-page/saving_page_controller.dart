import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_model.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_response.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/service/pengajuan_tabungan_service.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class SavingPageController extends GetxController {
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  PengajuanTabunganService pengajuanTabunganService =
      PengajuanTabunganService();
  CurrentPengajuanTabunganResponse? currentPengajuanTabunganiResponse;
  Rx<CurrentPengajuanTabunganModel> currentPengajuanTabunganModel =
      CurrentPengajuanTabunganModel().obs;

  RxBool isLoading = true.obs;
  RxBool isVisibleSignIn = true.obs;

  var selectedOption = ''.obs;
  final minimumPengajuanTabungan = 100000.obs;
  var status = 'null'.obs;
  var isEnough = false.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    storePengajuanTabungan();
    currentPengajuanTabungan();
    update();
    super.onInit();
  }

  Future currentPengajuanTabungan() async {
    try {
      final response =
          await pengajuanTabunganService.getShowCurrentPengajuanTabungan();
      currentPengajuanTabunganiResponse =
          CurrentPengajuanTabunganResponse.fromJson(response.data);
      currentPengajuanTabunganModel.value =
          currentPengajuanTabunganiResponse!.data;
      print('pengajuan tabungan : ${currentPengajuanTabunganModel.value}');
      update();
    } catch (e) {
      print('pengajuan tabungan error : $e');
    }
  }

  Future<void> storePengajuanTabungan() async {
    try {
      isLoading(true);
      final userId = showCurrentTabunganModel.value.userId;
      final selectedCategory = selectedOption.value;

      if (userId != null) {
        final response = await pengajuanTabunganService
            .postStorePengajuanTabungan(userId, selectedCategory);
        await currentPengajuanTabungan();
        Get.back();
        Get.snackbar(
            'Pengajuan Berhasil', 'Pengajuan Pengeluaran Tabungan Berhasil');
      } else {
        print('userId is null');
      }
    } catch (e) {
      isLoading(true);
      print(e);
    }
  }

  Future showCurrentTabungan() async {
    try {
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      update();
      print('saving amount : ${showCurrentTabunganModel.value.savingInt}');
    } catch (e) {
      print(e);
    }
  }

  Future deletePengajuanTabungan(String pengajuanId) async {
    try {
      await pengajuanTabunganService.deletePengajuanTabungan(pengajuanId);
      currentPengajuanTabunganModel.value = CurrentPengajuanTabunganModel();
      update();
      Get.snackbar(
        "Berhasil",
        "Pengajuan Tabungan berhasil dihapus",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      Get.snackbar(
        "Gagal",
        "Pengajuan Tabungan gagal dihapus",
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
      print(e);
    }
  }

  // Future showCurrentMinimumPengajuan() async {
  //   try {
  //     final response = await tabunganService.getShowCurrentMinimumPengajuan();
  //     showCurrentMinimumPengajuanResponse =
  //         ShowCurrentMinimumPengajuanResponse.fromJson(response.data);
  //     showCurrentMinimumPengajuanModel.value =
  //         showCurrentMinimumPengajuanResponse!.data;
  //     update();
  //     print(showCurrentMinimumPengajuanModel);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void selectedCategory(String option) {
    selectedOption.value = option;

    print("Selected Option: $option");
  }

  bool selectedCategoryIsEnough() {
    int selectedIndex = selectedOption.value == "SPP Bulanan" ? 0 : 1;

    print("Selected Index: $selectedIndex");

    if (showCurrentTabunganModel.value.savingInt! >= 100000) {
      isEnough(true);
    } else {
      isEnough(false);
    }
    print('isEnough: ${isEnough.value}');
    return isEnough.value;
  }
}
