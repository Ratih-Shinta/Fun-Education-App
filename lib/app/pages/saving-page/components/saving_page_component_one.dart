import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/components/ajukan_pengeluaran_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class SavingPageComponentOne extends GetView<SavingPageController> {
  const SavingPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.08,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.03),
            width: width,
            decoration: BoxDecoration(
                color: blackColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25))),
            child: Column(
              children: [
                AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text:
                        'Rp. ${controller.showCurrentTabunganModel.value.saving}\n',
                    style: tsHeadingLargeSemibold(whiteColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Total Tabungan',
                        style: tsBodySmallRegular(whiteColor),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.44,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4.5, bottom: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: warningColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.arrow_downward_rounded,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                          AutoSizeText.rich(
                            textAlign: TextAlign.start,
                            TextSpan(
                              text: 'Pemasukan\nTerakhir',
                              style: tsBodySmallRegular(blackColor).copyWith(
                                height: 1.3,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          AutoSizeText.rich(
                            TextSpan(
                                text:
                                    'Rp. ${controller.showCurrentTabunganModel.value.lastIncome}',
                                style: tsBodyLargeSemibold(blackColor)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.44,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4.5, bottom: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                          AutoSizeText.rich(
                            textAlign: TextAlign.start,
                            TextSpan(
                              text: 'Pengeluaran\nTerakhir',
                              style: tsBodySmallRegular(whiteColor).copyWith(
                                height: 1.3,
                              ),
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(height: 10),
                          AutoSizeText.rich(
                            TextSpan(
                                text:
                                    'Rp. ${controller.showCurrentTabunganModel.value.lastOutcome}',
                                style: tsBodyLargeSemibold(whiteColor)),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: height * 0.01),
                // AjukanPengeluaranContainer()
              ],
            ),
          ),
        ],
      );
    });
  }
}
