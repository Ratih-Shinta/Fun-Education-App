import 'package:fun_education_app/app/api/transaksi/models/current-transaksi-model/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/current-transaksi-model/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/models/show-available-model/show_available_month_response.dart';
import 'package:fun_education_app/app/api/transaksi/models/show-available-model/show_available_year_response.dart';
import 'package:fun_education_app/app/api/transaksi/show_current_transaksi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiPageController extends GetxController {
  TransaksiService transaksiService = TransaksiService();
  ShowCurrentTransaksiResponse? showCurrentTransaksiResponse;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModelByMonth =
      <ShowCurrentTransaksiModel>[].obs;

  ShowAvailableMonthResponse? showAvailableMonthResponse;
  ShowAvailableYearResponse? showAvailableYearResponse;

  var selectedMonth =
      '${DateFormat('MMMM', 'id_ID').format(DateTime.now())}'.obs;
  var selectedYear =
      '${DateFormat('yyyy', 'id_ID').format(DateTime.now())}'.obs;

  final List<String> allMonths = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    showAvailableMonths();
    showAvailableYears();
    showTransactionByMonthAndYear();
  }

  Future showAvailableMonths() async {
    try {
      final response = await transaksiService.getShowAvailableMonth(
        '2024',
      );
      showAvailableMonthResponse =
          ShowAvailableMonthResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future showAvailableYears() async {
    try {
      final response = await transaksiService.getShowAvailableYear();
      showAvailableYearResponse =
          ShowAvailableYearResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future showTransactionByMonthAndYear() async {
    try {
      isLoading(true);
      final response = await transaksiService.getTransaksiByYearAndMonth(
        selectedMonth.value,
        '2024',
      );
      showCurrentTransaksiResponse =
          ShowCurrentTransaksiResponse.fromJson(response.data);
      showCurrentTransaksiModelByMonth.value =
          showCurrentTransaksiResponse!.data;
      // if (showCurrentTransaksiResponse != null) {
      //   totalIncome.value = showCurrentTransaksiResponse!.totalIncome;
      //   totalOutcome.value = showCurrentTransaksiResponse!.totalOutcome;
      // }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }
}
