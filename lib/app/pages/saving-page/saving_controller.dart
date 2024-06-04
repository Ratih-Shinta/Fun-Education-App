import 'package:fun_education_app/app/api/tabungan/models/minimum-pengajuan-model/minimum_pengajuan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/minimum-pengajuan-model/minimum_pengajuan_response.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:get/get.dart';

class SavingController extends GetxController {
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  ShowCurrentMinimumPengajuanResponse? showCurrentMinimumPengajuanResponse;
  RxList<ShowCurrentMinimumPengajuanModel> showCurrentMinimumPengajuanModel =
      <ShowCurrentMinimumPengajuanModel>[].obs;

  RxBool isLoading = false.obs;
  RxBool isVisibleSignIn = true.obs;

  var selectedOption = ''.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    showCurrentMinimumPengajuan();
    pengajuanTabungan();

    update();
    super.onInit();
  }

  Future showCurrentTabungan() async {
    try {
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      update();
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

    print("Sek=lected Option: $option");
  }

  Future<void> pengajuanTabungan() async {
    try {
      isLoading(true);
      final userId = showCurrentMinimumPengajuanModel[0].userId;
      final selectedCategory = selectedOption.value;

      if (userId != null) {
        final response =
            await tabunganService.pengajuanTabungan(userId, selectedCategory);
        Get.snackbar(
            'Pengajuan Berhasil', 'Pengajuan Pengeluaran Tabungan Berhasil');
      } else {
        print('userId is null');
      }
    } catch (e) {
      isLoading(true);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  bool selectedCategoryIsEnough() {
    int selectedIndex = selectedOption.value == "SPP Bulanan" ? 0 : 1;

    print("Selected Index: $selectedIndex");
    print(showCurrentMinimumPengajuanModel[selectedIndex].isEnough!);

    return showCurrentMinimumPengajuanModel[selectedIndex].isEnough!;
  }

  // void setUserId(String userId) {
  //   '${showCurrentMinimumPengajuanModel[0].userId}';
  // }

  // void setSelectedCategory(String category) {
  //   selectedOption.value = selectedOption.value;
  // }
}
