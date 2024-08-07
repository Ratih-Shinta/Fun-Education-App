import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/bar_chart_widgets.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/bottomsheet_pilih_periode_report.dart';
import 'package:fun_education_app/app/pages/profile-page/components/bottomsheet_select_period_task.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/task_line_chart.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfileComponentTwo extends GetView<ProfilePageController> {
  final TaskLineChart taskLineChart = TaskLineChart();

  ProfileComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
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
            Obx(() {
              return InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetSelectPeriodTask();
                    },
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      AutoSizeText.rich(TextSpan(
                          text:
                              '${controller.selectedTaskPoint.value.toString()} Laporan',
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
          margin: EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: opacity5GreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AspectRatio(
            aspectRatio: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Obx(() {
                  return AutoSizeText.rich(
                    TextSpan(
                      text:
                          '${controller.selectedTaskPoint.value.toString()} Laporan Terakhir\n',
                      style: tsBodyMediumSemibold(blackColor)
                          .copyWith(height: 1.3),
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
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: blackColor,
                        ),
                        SizedBox(width: 5),
                        AutoSizeText.rich(TextSpan(
                            text: 'Point Tugas',
                            style: tsBodySmallRegular(blackColor)))
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: primaryColor,
                        ),
                        SizedBox(width: 5),
                        AutoSizeText.rich(TextSpan(
                            text: 'Point Laporan',
                            style: tsBodySmallRegular(blackColor)))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: LineChart(
                          taskLineChart.taskLineChart(),
                        ),
                      ),
                    );
                }),
              ],
            ),
          ),
        ),
        CommonButton(
          text: 'Lihat Riwayat Laporan',
          color: blackColor,
          icon: Icons.navigate_next_outlined,
        )
      ],
    );
  }
}
