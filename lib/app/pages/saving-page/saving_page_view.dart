import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/ajukan_pengeluaran_container.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class SavingPageView extends GetView<SavingPageController> {
  final TransaksiPageController transaksiPageController =
      Get.put(TransaksiPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              Stack(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText.rich(
                              TextSpan(
                                  text: 'Tabungan Ananda',
                                  style: tsTitleSmallSemibold(whiteColor)),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SAVING_INFORMATION_PAGE);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: height * 0.015,
                                  horizontal: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.info_outline,
                                  size: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.03),
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
                        SizedBox(height: height * 0.055),
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
                                    margin:
                                        EdgeInsets.only(right: 4.5, bottom: 8),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: warningColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.arrow_downward_rounded,
                                      color: whiteColor,
                                      size: 27,
                                    ),
                                  ),
                                  AutoSizeText.rich(
                                    textAlign: TextAlign.start,
                                    TextSpan(
                                      text: 'Pemasukan\nTerakhir',
                                      style: tsBodySmallRegular(blackColor)
                                          .copyWith(
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  AutoSizeText.rich(
                                    TextSpan(
                                        text:
                                            'Rp. ${controller.showCurrentTabunganModel.value.pemasukanTerakhir}',
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
                                    margin:
                                        EdgeInsets.only(right: 4.5, bottom: 8),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.arrow_upward_rounded,
                                      color: primaryColor,
                                      size: 27,
                                    ),
                                  ),
                                  AutoSizeText.rich(
                                    textAlign: TextAlign.start,
                                    TextSpan(
                                      text: 'Pengeluaran\nTerakhir',
                                      style: tsBodySmallRegular(whiteColor)
                                          .copyWith(
                                        height: 1.3,
                                      ),
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 10),
                                  AutoSizeText.rich(
                                    TextSpan(
                                        text:
                                            'Rp. ${controller.showCurrentTabunganModel.value.pengeluaranTerakhir}',
                                        style: tsBodyLargeSemibold(whiteColor)),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        AjukanPengeluaranContainer()
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                  horizontal: width * 0.05,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                              text: 'Riwayat Transaksi',
                              style: tsBodyLargeSemibold(blackColor)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                  text: 'Lihat Semua',
                                  style: tsBodySmallRegular(blackColor)),
                              maxLines: 2,
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: blackColor,
                              size: 12,
                            )
                          ],
                        ),
                      ],
                    ),
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
                ),
              ),
            ],
          ),
        )));
  }
}
