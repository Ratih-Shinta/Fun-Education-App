import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/report-history-page/components/report_history_component_one.dart';
import 'package:fun_education_app/app/pages/report-history-page/components/report_history_component_three.dart';
import 'package:fun_education_app/app/pages/report-history-page/components/report_history_component_two.dart';
import 'package:fun_education_app/app/pages/report-history-page/report_history_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReportHistoryPageView extends GetView<ReportHistoryPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Riwayat Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        onRefresh: () async {
          controller.showCurrentLaporanHarian();
          controller.ShowCurrentAvailable();
          controller.update();
          controller.refreshController.refreshCompleted();
        },
        controller: controller.refreshController,
        header: WaterDropHeader(
          complete: Text(
            'Refresh Completed',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                ReportHistoryPageComponentOne(),
                SizedBox(height: height * 0.015),
                ReportHistoryPageComponentTwo(),
                SizedBox(height: height * 0.02),
                ReportHistoryPageComponentThree(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
