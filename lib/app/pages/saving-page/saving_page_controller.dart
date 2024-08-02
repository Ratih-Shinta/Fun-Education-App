import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_model.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_response.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/service/pengajuan_tabungan_service.dart';
import 'package:fun_education_app/app/api/tabungan/models/minimum-pengajuan-model/minimum_pengajuan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/minimum-pengajuan-model/minimum_pengajuan_response.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:get/get.dart';

class SavingPageController extends GetxController {
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  ShowCurrentMinimumPengajuanResponse? showCurrentMinimumPengajuanResponse;
  RxList<ShowCurrentMinimumPengajuanModel> showCurrentMinimumPengajuanModel =
      <ShowCurrentMinimumPengajuanModel>[].obs;

  PengajuanTabunganService pengajuanTabunganService =
      PengajuanTabunganService();
  CurrentPengajuanTabunganResponse? currentPengajuanTabunganiResponse;
  Rx<CurrentPengajuanTabunganModel> currentPengajuanTabunganModel =
      CurrentPengajuanTabunganModel().obs;

  RxBool isLoading = true.obs;
  RxBool isVisibleSignIn = true.obs;

  var selectedOption = ''.obs;

  var status = 'Selesai'.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    // showCurrentMinimumPengajuan();
    pengajuanTabungan();
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

  Future showCurrentTabungan() async {
    try {
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      update();
      print('saving amount : ${showCurrentTabunganModel.value.saving}');
    } catch (e) {
      print(e);
    }
  }

  Future showCurrentMinimumPengajuan() async {
    try {
      final response = await tabunganService.getShowCurrentMinimumPengajuan();
      showCurrentMinimumPengajuanResponse =
          ShowCurrentMinimumPengajuanResponse.fromJson(response.data);
      showCurrentMinimumPengajuanModel.value =
          showCurrentMinimumPengajuanResponse!.data;
      update();
      print(showCurrentMinimumPengajuanModel);
    } catch (e) {
      print(e);
    }
  }

  void selectedCategory(String option) {
    selectedOption.value = option;

    print("Selected Option: $option");
  }

  Future<void> pengajuanTabungan() async {
    try {
      isLoading(true);
      final userId = showCurrentMinimumPengajuanModel[0].userId;
      final selectedCategory = selectedOption.value;

      if (userId != null) {
        final response = await tabunganService.postStorePengajuanTabungan(userId, selectedCategory);
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

  bool selectedCategoryIsEnough() {
    int selectedIndex = selectedOption.value == "SPP Bulanan" ? 0 : 1;

    print("Selected Index: $selectedIndex");
    print(showCurrentMinimumPengajuanModel[selectedIndex].isEnough!);

    return showCurrentMinimumPengajuanModel[selectedIndex].isEnough!;
  }

  Future<void> onREfresh() async {
    showCurrentTabungan();
    showCurrentMinimumPengajuan();
    pengajuanTabungan();
    currentPengajuanTabungan();
    update();
  }
}
