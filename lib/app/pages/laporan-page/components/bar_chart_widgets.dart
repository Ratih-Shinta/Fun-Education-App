import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BarChartWidgets {
  final LaporanPageController controller = Get.find();

  BarTouchData getBarTouchData(bool isWeekly) {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (_) => opacity50GreyColor,
        tooltipHorizontalAlignment: FLHorizontalAlignment.center,
        tooltipMargin: -10,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay =
              isWeekly ? getWeekDay(group.x) : getWeekNumber(group.x);
          return BarTooltipItem(
            '$weekDay\n',
            tsBodySmallSemibold(blackColor),
            children: <TextSpan>[
              TextSpan(
                text: (rod.toY - 1).toString(),
                style: tsBodySmallBold(blackColor),
              ),
            ],
          );
        },
      ),
      touchCallback: (FlTouchEvent event, barTouchResponse) {
        if (!event.isInterestedForInteractions ||
            barTouchResponse == null ||
            barTouchResponse.spot == null) {
          controller.touchedIndex.value = -1;
          return;
        }
        controller.touchedIndex.value =
            barTouchResponse.spot!.touchedBarGroupIndex;
      },
    );
  }

  String getWeekDay(int value) {
    switch (value) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jumat';
      case 5:
        return 'Sabtu';
      case 6:
        return 'Minggu';
      default:
        throw Error();
    }
  }

  String getWeekNumber(int value) {
    return 'Minggu ${value + 1}';
  }

  Widget mingguanTitles(double value, TitleMeta meta) {
    final style = tsBodyMediumSemibold(blackColor);
    final text = ['S', 'S', 'R', 'K', 'J', 'S', 'M'][value.toInt()];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Text(text, style: style),
    );
  }

  Widget bulananTitles(double value, TitleMeta meta) {
    final style = tsBodyMediumSemibold(blackColor);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: AutoSizeText.rich(
        TextSpan(
          text: 'Minggu\n',
          style: style.copyWith(height: 1.3),
          children: [
            TextSpan(
              text: '${value.toInt() + 1}',
              style: style,
            ),
          ],
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
