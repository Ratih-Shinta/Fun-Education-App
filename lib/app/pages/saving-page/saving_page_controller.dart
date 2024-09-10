import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/tabungan_service.dart';
import 'package:fun_education_app/app/api/transaksi/models/current-transaksi-model/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/current-transaksi-model/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/show_current_transaksi_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavingPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  TransaksiService transaksiService = TransaksiService();
  ShowCurrentTransaksiResponse? showCurrentTransaksiResponse;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModel =
      <ShowCurrentTransaksiModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    showCurrentTransaksi();
    update();
    super.onInit();
  }

  Future<void> showCurrentTransaksi() async {
    try {
      isLoading(true);
      final response = await transaksiService.getShowCurrentTransaksi();
      showCurrentTransaksiResponse =
          ShowCurrentTransaksiResponse.fromJson(response.data);
      showCurrentTransaksiModel.value = showCurrentTransaksiResponse!.data;
      isLoading(false);
      print('show current : ${showCurrentTransaksiModel[2].amount}');
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showCurrentTabungan() async {
    try {
      isLoading(true);
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      isLoading(false);
      update();
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }
}
