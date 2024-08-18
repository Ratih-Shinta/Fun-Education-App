import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/app/pages/report-history-page/report_history_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportHistoryPageComponentFour extends GetView<ReportHistoryController> {
  ReportHistoryPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor.withOpacity(0.05)),
      child: Obx(() {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.showCurrentLaporanHarianModel.length,
          itemBuilder: (BuildContext context, int index) {
            return ReportWidget(
              no: index + 1,
              text:
                  '${controller.showCurrentLaporanHarianModel[index].activity}',
              point: '${controller.showCurrentLaporanHarianModel[index].grade}',
            );
          },
        );
      }),
    );
  }
}
