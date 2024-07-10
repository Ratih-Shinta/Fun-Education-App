import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/bar_chart_widgets.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/bottomsheet_pilih_periode.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfileComponentTwo extends GetView<ProfilePageController> {
  ProfileComponentTwo({super.key});
  final BarChartWidgets barChartWidgets = BarChartWidgets();

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
                      return BottomsheetPilihPeriode(
                        title: 'Pilih Periode',
                        subtitle: 'Pilih Untuk Melihat Perkembangan Point',
                        options: ['Bulanan', 'Mingguan'],
                        onOptionSelected: (option) {
                          controller.setSelectedTime(option);
                        },
                        selectedOption: controller.selectedTime,
                      );
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
                          text: controller.selectedTime.value,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Obx(() {
                return AutoSizeText.rich(
                  TextSpan(
                    text: '${controller.selectedTime.value}\n',
                    style:
                        tsBodyMediumSemibold(blackColor).copyWith(height: 1.3),
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
              AspectRatio(
                  aspectRatio: 1.3,
                  child: BarChart(BarChartData(
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => blackColor.withOpacity(0.9),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        BarChartWidgets().getWeekDay(group.x.toInt());

                        String laporanValue =
                            // controller.mingguanData[2].barRods[0].toY.toInt().toString();
                            group.barRods[0].toY.toInt().toString();
                        String tugasValue =
                            // controller.mingguanData[1].barRods[0].toY.toInt().toString();
                            group.barRods[1].toY.toInt().toString();

                        return BarTooltipItem(
                          '${controller.selectedTime.value == 'Mingguan' ? BarChartWidgets().getWeekDay(group.x.toInt()) : BarChartWidgets().getWeekNumber(group.x.toInt())}\n',
                          tsBodySmallSemibold(whiteColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'ireng: $tugasValue\n',
                                style: tsBodySmallSemibold(successColor)),
                            TextSpan(
                                text: 'Red: $laporanValue',
                                style: tsBodySmallSemibold(dangerColor)),
                          ],
                        );
                      },
                    )),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: barChartWidgets.mingguanTitles,
                          reservedSize: 38,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: controller.mingguanData,
                    gridData: const FlGridData(show: false),
                  )))
            ],
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
