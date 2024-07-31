import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TransactionHistory extends StatelessWidget {
  final String categoryController;
  final String amountController;
  final String descController;
  final String dateController;

  TransactionHistory({
    Key? key,
    required this.categoryController,
    required this.amountController,
    required this.descController, required this.dateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.03),
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.023,
                    ),
                    decoration: BoxDecoration(
                      color: categoryController == 'income'
                          ? warningColor
                          : primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      categoryController == 'income'
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: whiteColor,
                      size: 20,
                    ),
                  ),
                  AutoSizeText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: categoryController == 'income'
                          ? 'Pemasukan\n'
                          : 'Pengeluaran\n',
                      style: tsBodyMediumSemibold(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: dateController,
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
              AutoSizeText.rich(
                TextSpan(
                  text:
                      'Rp. ${categoryController == 'income' ? '+Rp. ${amountController}' : '-Rp. ${amountController}'}',
                  style: tsBodySmallSemibold(
                      categoryController ==
                              'income'
                          ? greenColor
                          : dangerColor),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.05,
            ),
            decoration: BoxDecoration(
              color: opacityBlackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: 'Keterangan :\n',
                style: tsBodySmallSemibold(blackColor).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text:
                        '${descController ?? 'Tidak Ada'}',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
