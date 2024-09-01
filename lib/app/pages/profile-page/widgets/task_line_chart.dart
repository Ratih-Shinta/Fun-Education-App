import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/task_title_chart.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskLineChart {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  final TaskTitleChart taskTitleChart = TaskTitleChart();

  LineChartData taskLineChart() {
    final allSpots = profilePageController.spots;
    List<LineChartBarData> lineBarsData = [];
    List<FlSpot> segment = [];

    for (int i = 0; i < allSpots.length; i++) {
      final spot = allSpots[i];
      if (spot.y != 0) {
        segment.add(spot);
      }
      if (spot.y == 0 || i == allSpots.length - 1) {
        if (segment.isNotEmpty) {
          lineBarsData.add(LineChartBarData(
            spots: segment,
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: primaryColor, end: primaryColor)
                    .lerp(0.1)!
                    .withOpacity(0.5),
                ColorTween(begin: primaryColor, end: primaryColor)
                    .lerp(0.1)!
                    .withOpacity(0.5),
              ],
            ),
            barWidth: 5,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 4,
                color: primaryColor.withOpacity(0.6),
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  ColorTween(begin: primaryColor, end: whiteColor)
                      .lerp(0.1)!
                      .withOpacity(0.1),
                  ColorTween(begin: primaryColor, end: whiteColor)
                      .lerp(0.1)!
                      .withOpacity(0.1),
                ],
              ),
            ),
          ));
          segment = [];
        }
        if (spot.y == 0) {
          lineBarsData.add(LineChartBarData(
            spots: [spot],
            isCurved: false,
            color: transparentColor,
            barWidth: 5,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 4,
                color: greyColor.withOpacity(0.15),
              ),
            ),
            belowBarData: BarAreaData(show: false),
          ));
        }
      }
    }

    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => greyColor.withOpacity(0.7),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: 8,
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final TextStyle textStyle = tsBodySmallSemibold(whiteColor);
              return LineTooltipItem(
                '${touchedSpot.y.toString()}\n${DateFormat('dd MMMM yyy').format(profilePageController.touchedTitle[touchedSpot.x.toInt()])}',
                textStyle,
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        verticalInterval: 1,
        horizontalInterval: 20,
      ),
      // extraLinesData: ExtraLinesData(
      //   horizontalLines: [
      //     HorizontalLine(
      //       y: 70,
      //       color: dangerColor.withOpacity(0.8),
      //       strokeWidth: 2,
      //       dashArray: [5, 5],
      //     ),
      //   ],
      // ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget:
                profilePageController.selectedPoints.value == 'weekly'
                    ? taskTitleChart.weeklyBottomTitle
                    : taskTitleChart.monthlyBottomTitle,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: taskTitleChart.leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: profilePageController.maxX.value,
      minY: 0,
      maxY: 100,
      lineBarsData: lineBarsData,
    );
  }

  // LineChartData taskLineChart() {
  //   return LineChartData(
  //     lineTouchData: LineTouchData(
  //       enabled: true,
  //       touchTooltipData: LineTouchTooltipData(
  //         getTooltipColor: (_) => greyColor.withOpacity(0.7),
  //         tooltipHorizontalAlignment: FLHorizontalAlignment.center,
  //         tooltipMargin: 8,
  //         getTooltipItems: (List<LineBarSpot> touchedSpots) {
  //           return touchedSpots.map((LineBarSpot touchedSpot) {
  //             final TextStyle textStyle = tsBodySmallSemibold(whiteColor);
  //             return LineTooltipItem(
  //               '${touchedSpot.y.toString()}\n${profilePageController.touchedTitle[touchedSpot.x.toInt()]}',
  //               textStyle,
  //             );
  //           }).toList();
  //         },
  //       ),
  //     ),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: false,
  //       drawVerticalLine: false,
  //       verticalInterval: 1,
  //       horizontalInterval: 1,
  //     ),
  //     extraLinesData: ExtraLinesData(
  //       horizontalLines: [
  //         HorizontalLine(
  //           y: 70,
  //           color: dangerColor.withOpacity(0.8),
  //           strokeWidth: 2,
  //           dashArray: [5, 5],
  //         ),
  //       ],
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           reservedSize: 40,
  //           getTitlesWidget: taskTitleChart.bottomTitleWidgets,
  //           interval: 1,
  //         ),
  //       ),
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: taskTitleChart.leftTitleWidgets,
  //           reservedSize: 42,
  //           interval: 1,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //       border: Border.all(color: const Color(0xff37434d)),
  //     ),
  //     minX: 0,
  //     maxX: profilePageController.maxX.value,
  //     minY: 0,
  //     maxY: 100,
  //     lineBarsData: [
  //       LineChartBarData(
  //         // ignore: invalid_use_of_protected_member
  //         spots: profilePageController.spots.value,
  //         isCurved: true,
  //         gradient: LinearGradient(
  //           colors: [
  //             ColorTween(begin: primaryColor, end: primaryColor)
  //                 .lerp(0.2)!
  //                 .withOpacity(0.3),
  //             ColorTween(begin: primaryColor, end: primaryColor)
  //                 .lerp(0.2)!
  //                 .withOpacity(0.3),
  //           ],
  //         ),
  //         barWidth: 5,
  //         isStrokeCapRound: false,
  //         dotData: FlDotData(
  //           show: false,
  //           getDotPainter: (spot, percent, barData, index) =>
  //               FlDotCirclePainter(
  //             radius: 5,
  //             color: primaryColor,
  //             strokeWidth: 0,
  //             strokeColor: whiteColor,
  //           ),
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           gradient: LinearGradient(
  //             colors: [
  //               ColorTween(begin: primaryColor, end: primaryColor)
  //                   .lerp(0.2)!
  //                   .withOpacity(0.3),
  //               ColorTween(begin: primaryColor, end: primaryColor)
  //                   .lerp(0.2)!
  //                   .withOpacity(0.3),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
