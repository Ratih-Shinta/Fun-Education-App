import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_container_item.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_empty_item.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_permission_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LaporanPageComponentTwo extends GetView<LaporanPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
      if (controller.isLoadingReport.value) {
        return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin:
                  EdgeInsets.only(top: height * 0.015, bottom: height * 0.03),
              width: width,
              height: height * 0.3,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ));
      } else if (controller.showCurrentLaporanHarianModel.isNotEmpty &&
          controller.userPermission.value == 'Hadir') {
        return InkWell(
          onTap: () => Get.toNamed(
            Routes.DETAIL_LAPORAN_HARIAN_PAGE,
            arguments: {'dateLaporan': controller.selectedDate.value},
          ),
          child: ReportHistoryContainerItem(
            selectedDate: controller.selectedDate.value,
            totalPoint: controller.userGrade.value,
            note: controller.userNote.value,
          ),
        );
      } else if (controller.userPermission.isNotEmpty &&
          controller.userPermission.value != 'Hadir') {
        return ReportHistoryPermissionItem(
          permission: controller.userPermission.value,
          selectedDate: controller.selectedDate.value,
          note: controller.userNote.value,
          onTap: () {
            Get.toNamed(
              Routes.DETAIL_LAPORAN_HARIAN_PAGE,
              arguments: {'dateRiwayat': controller.selectedDate.value},
            );
          },
        );
      } else if (controller.userPermission.isEmpty) {
        return ReportHistoryEmptyItem(
            selectedDate: controller.selectedDate.value);
      } else {
        return Container();
      }
    });
  }
}
