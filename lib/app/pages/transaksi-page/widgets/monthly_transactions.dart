import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class MonthlyTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText('Februari 2024', style: tsBodyMediumRegular(blackColor)),
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
                        text: 'Rp. 100.000',
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
                        text: 'Rp. 100.000',
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
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TransactionHistory(
                // transactionModelIndex: index,
                // transactionIndex: index,
                );
          },
        ),
      ],
    );
  }
}
