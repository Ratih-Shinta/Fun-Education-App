import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/bottomsheet_pilih_periode_report.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/report_line_chart.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class PeringkatComponentOne extends GetView<LaporanPageController> {
  final ReportLineChart reportLineChart = ReportLineChart();
  PeringkatComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

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
                      AutoSizeText.rich(TextSpan(
                          text:
                              '${controller.selectedReportPoint.value} Laporan (Terakhir)',
                          style: tsBodySmallSemibold(blackColor))),
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
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: opacity5GreyColor,
          ),
          child: AspectRatio(
            aspectRatio: 0.61,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Obx(() {
                  return AutoSizeText.rich(
                    TextSpan(
                      text:
                          '${controller.selectedReportPoint.value} Laporan (Terakhir)\n',
                      style: tsBodyMediumSemibold(blackColor)
                          .copyWith(height: 1.5),
                      children: [
                        TextSpan(
                            text: 'Perkembangan point ananda',
                            style: tsBodySmallRegular(blackColor)),
                      ],
                    ),
                    maxLines: 2,
                    group: AutoSizeGroup(),
                  );
                }),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          '-',
                          style: tsTitleLargeSemibold(dangerColor),
                        ),
                        SizedBox(width: width * 0.02),
                        AutoSizeText(
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          'Rata - Rata',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.05),
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
                SizedBox(height: 30),
                Obx(() {
                  if (controller.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return AspectRatio(
                      aspectRatio: 0.8,
                      child: LineChart(
                        reportLineChart.reportLineChart(),
                      ),
                    );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
