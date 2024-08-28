import 'package:fl_chart/fl_chart.dart';
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
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModelByMonth =
      <ShowCurrentTransaksiModel>[].obs;

  RxBool isOpen = false.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    showCurrentTransaksi();
    showCurrentTransaksiByMonth();
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
      isOpen(true);
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

  final List<BarChartGroupData> mingguanData = [
    makeGroupData(0, 200000, 400000),
    makeGroupData(1, 800000, 1000000),
    makeGroupData(2, 600000, 100000),
    makeGroupData(3, 100000, 800000),
    makeGroupData(4, 200000, 400000),
    makeGroupData(5, 900000, 600000),
    makeGroupData(6, 800000, 400000),
  ];

  final List<BarChartGroupData> bulananData = [
    makeGroupData(0, 200000, 400000),
    makeGroupData(1, 800000, 100000),
    makeGroupData(2, 400000, 1000000),
    makeGroupData(3, 600000, 100000),
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

  var selectedMonth = DateFormat('MMMM', 'id_ID').format(DateTime.now()).obs;
  void setSelectedMonth(String month) {
    selectedMonth.value = month;
    print(selectedMonth.value);
  }
}
