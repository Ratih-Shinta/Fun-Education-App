import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportTitleChart {
  LaporanPageController laporanPageController =
      Get.put(LaporanPageController());

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = tsBodySmallRegular(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget weeklyBottomTitle(double value, TitleMeta meta) {
    TextStyle style = tsLabelLargeSemibold(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'SEN';
        break;
      case 1:
        text = 'SEL';
        break;
      case 2:
        text = 'RAB';
        break;
      case 3:
        text = 'KAM';
        break;
      case 4:
        text = 'JUM';
        break;
      case 5:
        text = 'SAB';
        break;
      case 6:
        text = 'MIN';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget monthlyBottomTitle(double value, TitleMeta meta) {
    TextStyle style = tsLabelLargeSemibold(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Minggu\n1';
        break;
      case 10:
        text = 'Minggu\n2';
        break;
      case 20:
        text = 'Minggu\n3';
        break;
      case 30:
        text = 'Minggu\n4';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text = '';
    if (value.toInt() < laporanPageController.bottomTitles.length) {
      text = laporanPageController.bottomTitles[value.toInt()] ?? '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
