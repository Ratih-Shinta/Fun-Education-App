import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/saving-page/components/bottomsheet_ajukan_pengeluaran.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class SavingView extends GetView<SavingController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: height * 0.06,
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
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              TextSpan(
                                text: 'Tabungan, ',
                                style: tsBodyMediumSemibold(whiteColor),
                                children: [
                                  TextSpan(
                                    text: 'Ananda',
                                    style: tsBodyMediumRegular(primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.info_outline))
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
                              width: width * 0.43,
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
                                        style: tsBodySmallRegular(blackColor)),
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
                              width: width * 0.43,
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
                                            'Rp. ${controller.showCurrentTabunganModel.value.pengeluaranTerakhir}',
                                        style: tsBodyLargeSemibold(whiteColor)),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                    text: 'Ajukan Pengeluaran\nTebungan?',
                                    style: tsBodyLargeBold(blackColor)),
                                maxLines: 2,
                              ),
                              SizedBox(height: 5),
                              AutoSizeText.rich(
                                TextSpan(
                                    text: 'Pastikan Saldo Tabungan Mencukupi?',
                                    style: tsBodySmallRegular(blackColor)),
                              ),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    // isScrollControlled: true,
                                    builder: (context) =>
                                        BottomsheetAjukanPengeluaran(),
                                  );
                                },
                                child: CommonButton(
                                  text: 'Lihat Pengeluaran',
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                              text: 'Riwayat Trasnaksi',
                              style: tsBodyLargeSemibold(blackColor)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                  text: 'Lihat Semua',
                                  style: tsBodySmallSemibold(blackColor)),
                              maxLines: 2,
                            ),
                            SizedBox(
                              width: 10,
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
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return TransactionHistory();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
