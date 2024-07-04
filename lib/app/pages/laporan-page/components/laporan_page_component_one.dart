import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/bottomsheet_alur_belajar_ananda.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageComponentOne extends GetView<LaporanPageController> {
  const LaporanPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.11,
                  height: height * 0.05,
                  padding: EdgeInsets.symmetric(
                    horizontal: height * 0.01,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/icTarget.svg',
                  ),
                ),
                SizedBox(width: width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Alur Belajar Ananda',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(whiteColor),
                    ),
                    AutoSizeText(
                      'Sekarang ananda berada\npada tahap :',
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      style: tsBodyMediumSemibold(whiteColor).copyWith(
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * 0.025),
            InkWell(
              onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return BottomsheetAlurBelajarAnanda();
                            },
                            isScrollControlled: true,
                            backgroundColor: whiteColor,
                          );
                        },
              
              // {
              //   showModalBottomSheet(
              //     context: context,
              //     builder: (context) => BottomsheetAlurBelajarAnanda(),
              //     isScrollControlled: true,
              //   );
              // },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.015,
                ),
                height: height * 0.14,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.016,
                          decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              controller.showCurrentAlurBelajarModel.value
                                          .tahap ==
                                      'A'
                                  ? 'Mengenalkan Buku A'
                                  : controller.showCurrentAlurBelajarModel.value
                                              .tahap ==
                                          'B'
                                      ? 'Mengenalkan Buku B'
                                      : 'Mengenalkan Buku C',
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              style: tsBodyMediumSemibold(whiteColor),
                            ),
                            SizedBox(height: height * 0.008),
                            AutoSizeText.rich(
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              TextSpan(
                                text: '\u2022 ',
                                style: tsBodySmallRegular(whiteColor),
                                children: [
                                  TextSpan(
                                    // text: 'Menebalkan Huruf',
                                    text: controller.showCurrentAlurBelajarModel
                                                .value.tahap ==
                                            'A'
                                        ? 'Menebalkan Huruf'
                                        : controller.showCurrentAlurBelajarModel
                                                    .value.tahap ==
                                                'B'
                                            ? 'Mencontoh Suku Kata'
                                            : 'Menyalin Kalimat',
                                    style: tsBodySmallRegular(whiteColor),
                                  ),
                                ],
                              ),
                            ),
                            AutoSizeText.rich(
                              group: AutoSizeGroup(),
                              maxLines: 2,
                              TextSpan(
                                text: '\u2022 ',
                                style: tsBodySmallRegular(whiteColor),
                                children: [
                                  TextSpan(
                                    // text: 'Membaca Kartu Baju Sampai\n  Cabe',
                                    text: controller.showCurrentAlurBelajarModel
                                                .value.tahap ==
                                            'A'
                                        ? 'Membaca Kartu Baju Sampai\n  Cabe'
                                        : controller.showCurrentAlurBelajarModel
                                                    .value.tahap ==
                                                'B'
                                            ? 'Membaca Kartu Baju Sampai\n  Cabe'
                                            : 'Membaca Kartu Baju Sampai\n  Cabe',
                                    style: tsBodySmallRegular(whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
