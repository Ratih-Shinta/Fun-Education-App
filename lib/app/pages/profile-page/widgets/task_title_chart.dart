import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportTitleChart {
  ProfilePageController profilePageController =
      Get.put(ProfilePageController());
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
        text = profilePageController.bottomTitles[0] ?? '';
        break;
      case 1:
        text = profilePageController.bottomTitles[1] ?? '';
        break;
      case 2:
        text = profilePageController.bottomTitles[2] ?? '';
        break;
      case 3:
        text = profilePageController.bottomTitles[3] ?? '';
        break;
      case 4:
        text = profilePageController.bottomTitles[4] ?? '';

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
        text = profilePageController.bottomTitles[0] ?? '';
        break;
      case 3:
        text = profilePageController.bottomTitles[1] ?? '';
        break;
      case 6:
        text = profilePageController.bottomTitles[2] ?? '';
        break;
      case 9:
        text = profilePageController.bottomTitles[3] ?? '';

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
        text = profilePageController.bottomTitles[0] ?? '';
        break;
      case 5:
        text = profilePageController.bottomTitles[1] ?? '';
        break;
      case 10:
        text = profilePageController.bottomTitles[2] ?? '';
        break;
      case 15:
        text = profilePageController.bottomTitles[3] ?? '';
        break;
      case 20:
        text = profilePageController.bottomTitles[4] ?? '';

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
        text = profilePageController.bottomTitles[0] ?? '';
        break;
      case 10:
        text = profilePageController.bottomTitles[1] ?? '';
        break;
      case 20:
        text = profilePageController.bottomTitles[2] ?? '';
        break;
      case 29:
        text = profilePageController.bottomTitles[3] ?? '';

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
