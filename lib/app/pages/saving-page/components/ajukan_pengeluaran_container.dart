import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/saving-page/components/bottomsheet_ajukan_pengeluaran.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class AjukanPengeluaranContainer extends GetView<SavingPageController> {
  const AjukanPengeluaranContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Ajukan PengeluaranTabungan?\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Pastikan Saldo Mencukupi',
                  style: tsBodySmallRegular(blackColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
          SizedBox(height: height * 0.03),
          Obx(() {
            if (controller.currentPengajuanTabunganModel.value.status ==
                'Rejected') {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(TextSpan(
                            text: 'Tabungan sedang diajukan untuk :',
                            style: tsBodySmallRegular(blackColor))),
                        SizedBox(height: height * 0.013),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AutoSizeText.rich(
                                TextSpan(
                                    text: 'Kegiatan Belajar Diluar',
                                    style: tsBodyMediumSemibold(blackColor)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: dangerColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: AutoSizeText.rich(TextSpan(
                                  text: 'Gagal',
                                  style: tsBodySmallSemibold(whiteColor))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CommonButton(
                    text: 'Selesai',
                    backgroundColor: dangerColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.deletePengajuanTabungan(
                          controller.currentPengajuanTabunganModel.value.id!);
                    },
                  )
                ],
              );
            } else if (controller.currentPengajuanTabunganModel.value.status ==
                'Accepted') {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(TextSpan(
                            text: 'Tabungan sedang diajukan untuk :',
                            style: tsBodySmallRegular(blackColor))),
                        SizedBox(height: height * 0.013),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AutoSizeText.rich(
                                TextSpan(
                                    text: 'Kegiatan Belajar Diluar',
                                    style: tsBodyMediumSemibold(blackColor)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: successColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: AutoSizeText.rich(TextSpan(
                                  text: 'Diterima',
                                  style: tsBodySmallSemibold(whiteColor))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CommonButton(
                    text: 'Selesai',
                    backgroundColor: successColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.deletePengajuanTabungan(
                          controller.currentPengajuanTabunganModel.value.id!);
                    },
                  )
                ],
              );
            } else if (controller.currentPengajuanTabunganModel.value.status ==
                'Pending' || controller.currentPengajuanTabunganModel.value.status == 'Pending Accepted'
                ) {
              return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(TextSpan(
                        text: 'Tabungan sedang diajukan untuk :',
                        style: tsBodySmallRegular(blackColor))),
                    SizedBox(height: height * 0.013),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText.rich(
                            TextSpan(
                                text:
                                    '${controller.currentPengajuanTabunganModel.value.category}',
                                style: tsBodyMediumSemibold(blackColor)),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: warningColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: AutoSizeText.rich(TextSpan(
                              text: 'Diajukan',
                              style: tsBodySmallSemibold(whiteColor))),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomsheetAjukanPengeluaran();
                      },
                      isScrollControlled: true,
                      backgroundColor: whiteColor,
                    );
                  },
                  child: Row(
                    children: [
                      AutoSizeText.rich(TextSpan(
                          text: 'Pilih Pengeluaran',
                          style: tsBodySmallSemibold(blackColor))),
                      Icon(
                        Icons.navigate_next,
                        color: blackColor,
                        size: 18,
                      )
                    ],
                  ));
            }
          })
        ],
      ),
    );
  }
}
