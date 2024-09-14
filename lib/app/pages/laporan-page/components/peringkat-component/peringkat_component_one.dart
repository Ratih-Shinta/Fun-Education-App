import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/bottomsheet_pilih_periode_report.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/report_line_chart.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PeringkatComponentOne extends GetView<LaporanPageController> {
  final ReportLineChart reportLineChart = ReportLineChart();
  PeringkatComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        SizedBox(height: 20),
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
            Obx(() {
              return InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetSelectPeriodReport();
                    },
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      AutoSizeText(
                        controller.selectedPoint.value == 'weekly'
                            ? 'Mingguan'
                            : 'Bulanan',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallSemibold(blackColor),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
        Obx(
          () {
            if (controller.isLoadingStatistic.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: width,
                  height: height * 0.65,
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.025,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: greyColor.withOpacity(0.05),
                ),
                child: AspectRatio(
                  aspectRatio: 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(() {
                        return AutoSizeText.rich(
                          TextSpan(
                            // text:
                            //     '${controller.selectedReportPoint.value} Laporan (Terakhir)\n',
                            text: controller.selectedPoint.value == 'weekly'
                                ? 'Mingguan (Terakhir)\n'
                                : 'Bulanan (Terakhir)\n',
                            style: tsBodyMediumSemibold(blackColor)
                                .copyWith(height: 1.5),
                            children: [
                              TextSpan(
                                text: 'Perkembangan point ananda',
                                style: tsBodySmallRegular(blackColor),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          group: AutoSizeGroup(),
                        );
                      }),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                          vertical: height * 0.008,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: whiteColor,
                        ),
                        child: Row(
                          children: [
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     AutoSizeText(
                            //       group: AutoSizeGroup(),
                            //       maxLines: 1,
                            //       '-',
                            //       style: tsTitleLargeSemibold(dangerColor),
                            //     ),
                            //     SizedBox(width: width * 0.02),
                            //     AutoSizeText(
                            //       group: AutoSizeGroup(),
                            //       maxLines: 1,
                            //       'Rata - Rata',
                            //       style: tsBodySmallRegular(blackColor),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(width: width * 0.05),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: successColor,
                                ),
                                SizedBox(width: width * 0.02),
                                AutoSizeText(
                                  group: AutoSizeGroup(),
                                  maxLines: 1,
                                  'Point Laporan',
                                  style: tsBodySmallRegular(blackColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01,
                          ),
                          child: Obx(() => controller.bottomTitles.isEmpty
                              ? Text('Tidak Ada data')
                              : LineChart(
                                  reportLineChart.reportLineChart(),
                                )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
