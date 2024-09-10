import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/show_current_transaksi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiPageController extends GetxController {
  TransaksiService transaksiService = TransaksiService();
  ShowCurrentTransaksiResponse? showCurrentTransaksiResponse;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModel =
      <ShowCurrentTransaksiModel>[].obs;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModelByMonth =
      <ShowCurrentTransaksiModel>[].obs;

  var selectedMonth = DateFormat('MMMM', 'id_ID').format(DateTime.now()).obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    showCurrentTransaksi();
    showCurrentTransaksiByMonth();
    update();
    super.onInit();
  }

  Future<void> showCurrentTransaksi() async {
    try {
      isLoading(true);
      final response = await transaksiService.getShowCurrentTransaksi();
      showCurrentTransaksiResponse =
          ShowCurrentTransaksiResponse.fromJson(response.data);
      showCurrentTransaksiModel.value = showCurrentTransaksiResponse!.data!;
      isLoading(false);
      print('show current : ${showCurrentTransaksiModel[2].amount}');
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> showCurrentTransaksiByMonth() async {
    try {
      isLoading(true);
      final response =
          await transaksiService.getTransaksiByMonth(selectedMonth.value);
      showCurrentTransaksiResponse =
          ShowCurrentTransaksiResponse.fromJson(response.data);
      showCurrentTransaksiModelByMonth.value =
          showCurrentTransaksiResponse!.data!;
      isLoading(false);
      print('by month : ${showCurrentTransaksiModelByMonth[0].amount}');
      update();
    } catch (e) {
      print(e);
    }
  }

  void setSelectedMonth(String month) {
    selectedMonth.value = month;
    print(selectedMonth.value);
  }
}
