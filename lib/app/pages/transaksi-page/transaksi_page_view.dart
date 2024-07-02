import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/mingguan_bar_chart.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/monthly_transactions.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TransaksiPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
        title: AutoSizeText.rich(
          TextSpan(
            text: 'Riwayat Transaksi',
            style: tsBodyLargeSemibold(blackColor),
          ),
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/icChart.svg'),
                        SizedBox(width: width * 0.02),
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'Statistic',
                            style: tsBodyMediumSemibold(blackColor),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // showModalBottomSheet<void>(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return BottomsheetPilihPediodePoint();
                        //   },
                        //   isScrollControlled: true,
                        //   backgroundColor: whiteColor,
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            AutoSizeText.rich(
                              TextSpan(
                                text: 'Mingguan',
                                // text: controller.selectedTime.value,
                                style: tsBodySmallSemibold(blackColor),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                MingguanBarChart(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.format_list_bulleted),
                        SizedBox(width: width * 0.02),
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'List Riwayat',
                            style: tsBodyMediumSemibold(blackColor),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // showModalBottomSheet<void>(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return BottomsheetPilihPediodePoint();
                        //   },
                        //   isScrollControlled: true,
                        //   backgroundColor: whiteColor,
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            AutoSizeText.rich(
                              TextSpan(
                                text: 'Februari',
                                // text: controller.selectedTime.value,
                                style: tsBodySmallSemibold(blackColor),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.012),
                MonthlyTransactions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
