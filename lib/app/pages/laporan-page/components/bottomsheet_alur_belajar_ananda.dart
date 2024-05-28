import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/timeline_tile_alur_belajar_ananda.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAlurBelajarAnanda extends GetView<LaporanPageController> {
  const BottomsheetAlurBelajarAnanda({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.63,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.03, horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * 0.01),
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: opacity20GreyColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.016,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Alur Belajar Ananda\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Apa saja yang akan dipelajari?',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Column(
                children: [
                  TimelineTileAlurBelajarAnanda(
                    isFirst: true,
                    isLast: false,
                    isDone: true,
                    endChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          group: AutoSizeGroup(),
                          'Mengenalkan Buku A',
                          style: tsBodyMediumSemibold(blackColor),
                        ),
                        SizedBox(height: height * 0.008),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Menebalkan Huruf',
                              style: tsBodySmallRegular(blackColor),
                            ),
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Membaca Kartu Baju Sampai Cabe',
                              style: tsBodySmallRegular(blackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TimelineTileAlurBelajarAnanda(
                    isFirst: false,
                    isLast: false,
                    isDone: false,
                    endChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          group: AutoSizeGroup(),
                          'Mengenalkan Buku B',
                          style: tsBodyMediumSemibold(blackColor),
                        ),
                        SizedBox(height: height * 0.008),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Mencontoh Suku Kata',
                              style: tsBodySmallRegular(blackColor),
                            ),
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Membaca Kartu Baju Sampai Cabe',
                              style: tsBodySmallRegular(blackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TimelineTileAlurBelajarAnanda(
                    isFirst: false,
                    isLast: true,
                    isDone: false,
                    endChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          group: AutoSizeGroup(),
                          'Mengenalkan Buku C',
                          style: tsBodyMediumSemibold(blackColor),
                        ),
                        SizedBox(height: height * 0.008),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Menyalin Kalimat',
                              style: tsBodySmallRegular(blackColor),
                            ),
                            AutoSizeText(
                              maxLines: 1,
                              group: AutoSizeGroup(),
                              '• Membaca Kartu Baju Sampai Cabe',
                              style: tsBodySmallRegular(blackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonButton(
              text: 'Tutup',
              onPressed: () => Navigator.pop(context),
              color: secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}
