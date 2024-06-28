import 'package:fun_education_app/app/api/transaksi/models/item_transaction_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/service/show_current_transaksi_service.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/monthly_transactions.dart';
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

  ItemTransactionModel? getTransaction(int transactionModelIndex, int transactionIndex) {
    final transactionModel = getTransactionModel(transactionModelIndex);
    if (transactionModel != null && transactionIndex < transactionModel.transaction.length) {
      return transactionModel.transaction[transactionIndex];
    }
    return null;
  }
}
