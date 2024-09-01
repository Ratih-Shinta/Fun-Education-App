import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/profile-page/components/bottomsheet_select_period_task.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/task_line_chart.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileComponentTwo extends GetView<ProfilePageController> {
  final TaskLineChart taskLineChart = TaskLineChart();

  ProfileComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                              // '${controller.selectedPoints.value.toString()} Laporan',
                              controller.selectedPoints.value == 'weekly'
                                  ? 'Mingguan'
                                  : 'Bulanan',
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
            color: greyColor.withOpacity(0.05),
          ),
          child: AspectRatio(
            aspectRatio: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Obx(() {
                  return AutoSizeText.rich(
                    TextSpan(
                      // text:
                      //     '${controller.selectedPoints.value} Tugas (Terakhir)\n',
                      text: controller.selectedPoints.value == 'weekly'
                          ? 'Mingguan (Terakhir)\n'
                          : 'Bulanan (Terakhir)\n',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: primaryColor,
                    ),
                    SizedBox(width: width * 0.02),
                    AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      'Point Tugas',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                AspectRatio(
                  aspectRatio: 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                    ),
                    child: Obx(() => controller.statisticTaskModel.isEmpty
                        ? Text('Tidak Ada data')
                        : LineChart(
                            taskLineChart.taskLineChart(),
                          )),
                  ),
                ),
              ],
            ),
          ),
        ),
        CommonButton(
          // isLoading: controller.isLoading.value,
          text: 'Lihat Riwayat Laporan',
          backgroundColor: blackColor,
          textColor: whiteColor,
          icon: Icons.navigate_next_outlined,
          onPressed: () {
            Get.toNamed(Routes.REPORT_HISTORY_PAGE);
          },
        )
      ],
    );
  }
}
