import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
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
      default:
        return Container();
    }

    return AutoSizeText(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget bottomTitleWidgets5Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = laporanPageController.bottomTitles[0] ?? '';
        break;
      case 1:
        text = laporanPageController.bottomTitles[1] ?? '';
        break;
      case 2:
        text = laporanPageController.bottomTitles[2] ?? '';
        break;
      case 3:
        text = laporanPageController.bottomTitles[3] ?? '';
        break;
      case 4:
        text = laporanPageController.bottomTitles[4] ?? '';

      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: AutoSizeText(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitleWidgets10Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = laporanPageController.bottomTitles[0] ?? '';
        break;
      case 3:
        text = laporanPageController.bottomTitles[1] ?? '';
        break;
      case 6:
        text = laporanPageController.bottomTitles[2] ?? '';
        break;
      case 9:
        text = laporanPageController.bottomTitles[3] ?? '';

      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: AutoSizeText(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitleWidgets20Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = laporanPageController.bottomTitles[0] ?? '';
        break;
      case 5:
        text = laporanPageController.bottomTitles[1] ?? '';
        break;
      case 10:
        text = laporanPageController.bottomTitles[2] ?? '';
        break;
      case 15:
        text = laporanPageController.bottomTitles[3] ?? '';
        break;
      case 20:
        text = laporanPageController.bottomTitles[4] ?? '';

      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: AutoSizeText(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget bottomTitleWidgets30Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = laporanPageController.bottomTitles[0] ?? '';
        break;
      case 10:
        text = laporanPageController.bottomTitles[1] ?? '';
        break;
      case 20:
        text = laporanPageController.bottomTitles[2] ?? '';
        break;
      case 29:
        text = laporanPageController.bottomTitles[3] ?? '';

      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: AutoSizeText(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
