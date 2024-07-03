import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/api/transaksi/models/item_transaction_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/service/show_current_transaksi_service.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/monthly_transactions.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiPageController extends GetxController {
  TransaksiService transaksiService = TransaksiService();
  ShowCurrentTransaksiResponse? showCurrentTransaksiResponse;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModel =
      <ShowCurrentTransaksiModel>[].obs;
  RxList<ItemTransactionModel> itemTransactionModel =
      <ItemTransactionModel>[].obs;

  RxBool isOpen = false.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    showCurrentTransaksi();
    showCurrentTransaksi();
    update();
    super.onInit();
  }

  void toggleExpansion(int index) {
    if (isOpen.value == true) {
      MonthlyTransactions();
    }
  }

  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateFormat('dd-MM-yyyy').parse(dateString);
      return DateFormat('dd MMMM yyyy').format(dateTime);
    } on Exception catch (e) {
      try {
        DateTime dateTime = DateFormat('MM-yyyy').parse(dateString);
        return DateFormat('MMMM yyyy').format(dateTime);
      } catch (e) {
        print('Error parsing date: $e');
        return dateString;
      }
    }
  }

  Future<void> showCurrentTransaksi() async {
    try {
      isOpen(true);
      final response = await transaksiService.getShowCurrentTransaksi();
      showCurrentTransaksiResponse =
          ShowCurrentTransaksiResponse.fromJson(response.data);
      showCurrentTransaksiModel.value = showCurrentTransaksiResponse!.data;
      itemTransactionModel.assignAll(
          showCurrentTransaksiModel.expand((model) => model.transaction));
      update();
    } catch (e) {
      print(e);
    }
  }

  ShowCurrentTransaksiModel? getTransactionModel(int index) {
    if (index < showCurrentTransaksiModel.length) {
      return showCurrentTransaksiModel[index];
    }
    return null;
  }

  ItemTransactionModel? getTransaction(
      int transactionModelIndex, int transactionIndex) {
    final transactionModel = getTransactionModel(transactionModelIndex);
    if (transactionModel != null &&
        transactionIndex < transactionModel.transaction.length) {
      return transactionModel.transaction[transactionIndex];
    }
    return null;
  }

  final List<BarChartGroupData> mingguanData = [
    makeGroupData(0, 200, 500),
    makeGroupData(1, 100, 1000),
    makeGroupData(2, 150, 500),
    makeGroupData(3, 30, 1000),
    makeGroupData(4, 230, 500),
    makeGroupData(5, 1000, 500),
    makeGroupData(6, 310, 500),
  ];

  final List<BarChartGroupData> bulananData = [
    makeGroupData(0, 200, 500),
    makeGroupData(1, 100, 1000),
    makeGroupData(2, 150, 500),
    makeGroupData(3, 30, 1000),
  ];

  static BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: dangerColor),
        BarChartRodData(toY: y2, color: successColor),
      ],
    );
  }

  var selectedTime = 'Mingguan'.obs;
  void setSelectedTime(String period) {
    selectedTime.value = period;
    print(selectedTime.value);
  }
}
