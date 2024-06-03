import 'package:fun_education_app/app/api/transaksi/models/item_transaction_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_model.dart';
import 'package:fun_education_app/app/api/transaksi/models/show_current_transaksi_response.dart';
import 'package:fun_education_app/app/api/transaksi/service/show_current_transaksi_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiPageController extends GetxController {
  TransaksiService transaksiService = TransaksiService();
  ShowCurrentTransaksiResponse? showCurrentTransaksiResponse;
  RxList<ShowCurrentTransaksiModel> showCurrentTransaksiModel = RxList<ShowCurrentTransaksiModel>();
  RxList<ItemTransactionModel> itemTransactionModel = RxList<ItemTransactionModel>();

  var expandedIndex = (-1).obs;
  final RxList<RxBool> isVisibleList = RxList.filled(0, false.obs);

  @override
  void onInit() {
    showCurrentTransaksi();
    update();
    super.onInit();
  }

void toggleExpansion(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    }
  }

  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateFormat('MM-yyyy').parse('$dateString');
      return DateFormat('MMMM yyyy').format(dateTime);
    } catch (e) {
      print('Error parsing date: $e');
      return dateString;
    }
  }

  Future<void> showCurrentTransaksi() async {
    try {
      final response = await transaksiService.getShowCurrentTransaksi();
      showCurrentTransaksiResponse = ShowCurrentTransaksiResponse.fromJson(response.data);
      if (showCurrentTransaksiResponse != null) {
      showCurrentTransaksiModel.assignAll(showCurrentTransaksiResponse!.data);

      List<ItemTransactionModel> transactions = [];
      for (var model in showCurrentTransaksiModel) {
        transactions.addAll(model.transaction);
      }
      itemTransactionModel.assignAll(transactions);
    }
      update();
    } catch (e) {
      print(e);
    }
  }
}
