import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import '../widgets/bar_chart_widgets.dart';

class CustomBarChartData {
  final BarChartWidgets widgets = BarChartWidgets();
  final LaporanPageController controller = Get.find();

  final Color barBackgroundColor = opacity10GreyColor;
  final Color touchedBarColor = secondaryColor;

  BarChartGroupData makeGroupData(
    bool mingguan,
    int x,
    double y, {
    bool isTouched = false,
    double width = 16,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? touchedBarColor : primaryColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: mingguan ? 200 : 2000,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> mingguanData() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                true,
                0,
                (controller.showCurrentPointMingguanModel.value.mondayPoint ?? 0).toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 1:
            return makeGroupData(
                true,
                1,
                (controller.showCurrentPointMingguanModel.value.tuesdayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 2:
            return makeGroupData(
                true,
                2,
                (controller.showCurrentPointMingguanModel.value.wednesdayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 3:
            return makeGroupData(
                true,
                3,
                (controller.showCurrentPointMingguanModel.value.thursdayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 4:
            return makeGroupData(
                true,
                4,
                (controller.showCurrentPointMingguanModel.value.fridayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 5:
            return makeGroupData(
                true,
                5,
                (controller.showCurrentPointMingguanModel.value.saturdayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 6:
            return makeGroupData(
                true,
                6,
                (controller.showCurrentPointMingguanModel.value.sundayPoint ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          default:
            throw Error();
        }
      });

  List<BarChartGroupData> bulananData() => List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                false,
                0,
                (controller.showCurrentPointBulananModel.value.week1Point ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 1:
            return makeGroupData(
                false,
                1,
                (controller.showCurrentPointBulananModel.value.week2Point ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 2:
            return makeGroupData(
                false,
                2,
                (controller.showCurrentPointBulananModel.value.week3Point ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          case 3:
            return makeGroupData(
                false,
                3,
                (controller.showCurrentPointBulananModel.value.week4Point ?? 0)
                    .toDouble(),
                isTouched: i == controller.touchedIndex.value);
          default:
            throw Error();
        }
      });

  BarChartData mingguanBar() {
    return BarChartData(
      barTouchData: widgets.getBarTouchData(true, controller.touchedIndex),
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: widgets.mingguanTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      barGroups: mingguanData(),
      gridData: const FlGridData(show: false),
    );
  }

  BarChartData bulananBar() {
    return BarChartData(
      barTouchData: widgets.getBarTouchData(false, controller.touchedIndex),
      titlesData: FlTitlesData(
        show: true,
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: widgets.bulananTitles,
            reservedSize: 45,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      barGroups: bulananData(),
      gridData: const FlGridData(show: false),
    );
  }
}
