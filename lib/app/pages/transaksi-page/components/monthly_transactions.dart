import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MonthlyTransactions extends GetView<TransaksiPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText('${controller.selectedMonth.value} 2024',
            style: tsBodyMediumRegular(blackColor)),
        SizedBox(height: height * 0.017),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.43,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 4.5, bottom: 8),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: warningColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.arrow_downward,
                      color: whiteColor,
                      size: 27,
                    ),
                  ),
                  AutoSizeText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                        text: 'Pemasukan\nTerakhir',
                        style: tsBodySmallRegular(whiteColor)),
                  ),
                  SizedBox(height: 10),
                  AutoSizeText.rich(
                    TextSpan(
                        text:
                            'Rp. ${controller.showCurrentTransaksiResponse!.totalIncome}',
                        style: tsBodyLargeSemibold(whiteColor)),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.43,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 4.5, bottom: 8),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.arrow_upward,
                      color: primaryColor,
                      size: 27,
                    ),
                  ),
                  AutoSizeText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                        text: 'Pengeluaran\nTerakhir',
                        style: tsBodySmallRegular(whiteColor)),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  AutoSizeText.rich(
                    TextSpan(
                        text:
                            'Rp. ${controller.showCurrentTransaksiResponse!.totalOutcome}',
                        style: tsBodyLargeSemibold(whiteColor)),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.022),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.showCurrentTransaksiModelByMonth.length,
          itemBuilder: (BuildContext context, int index) {
            return TransactionHistory(
              categoryController:
                  controller.showCurrentTransaksiModelByMonth[index].category!,
              amountController:
                  controller.showCurrentTransaksiModelByMonth[index].amount!,
              descController:
                  controller.showCurrentTransaksiModelByMonth[index].desc ??
                      'Tidak Ada',
              dateController: DateFormat('dd MMMM yyyy', 'id_ID').format(
                  DateTime.parse(controller
                      .showCurrentTransaksiModelByMonth[index].date
                      .toString())),
            );
          },
        ),
      ],
    );
  }
}
