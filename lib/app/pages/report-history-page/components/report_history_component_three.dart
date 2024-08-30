import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/laporan_container.dart';
import 'package:fun_education_app/app/pages/report-history-page/report_history_controller.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_container_item.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_empty_item.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_permission_item.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportHistoryPageComponentThree
    extends GetView<ReportHistoryPageController> {
  const ReportHistoryPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.showCurrentLaporanHarianModel.isNotEmpty &&
          controller.userPermission.value == 'Hadir') {
        return InkWell(
          onTap: () {
            Get.toNamed(Routes.DETAIL_LAPORAN_HARIAN_PAGE,
                arguments: {'dateRiwayatHadir': controller.selectedDay.value});
          },
          child: ReportHistoryContainerItem(
            selectedDate: controller.selectedDay.value,
            totalPoint: controller.userGrade.value,
            note: controller.userNote.value,
          ),
          // child: LaporanContainer(
          //   controller.showCurrentLaporanHarianResponse?.totalPoint ?? 0,
          //   controller.showCurrentLaporanHarianResponse?.note == null
          //       ? '0'
          //       : '1',
          //   date:
          //       '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(controller.selectedDate.value)}',
          // ),
        );
      } else if (controller.userPermission.isNotEmpty &&
          controller.userPermission.value != 'Hadir') {
        return ReportHistoryPermissionItem(
          permission: controller.userPermission.value,
          selectedDate: controller.selectedDay.value,
          note: controller.userNote.value,
          onTap: () {
            Get.toNamed(
              Routes.DETAIL_LAPORAN_HARIAN_PAGE,
              arguments: {'dateRiwayat': controller.selectedDay.value},
            );
          },
        );
      } else if (controller.userPermission.isEmpty) {
        return ReportHistoryEmptyItem(
            selectedDate: controller.selectedDay.value);
      } else {
        return Container();
      }
    });
  }
}
