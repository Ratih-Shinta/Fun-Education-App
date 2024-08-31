import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_container_item.dart';
import 'package:fun_education_app/app/pages/report-history-page/widgets/report_history_permission_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailLaporanComponentTwo extends GetView<DetailLaporanHarianController> {
  DetailLaporanComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
      if (controller.isLoading.value == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.showCurrentLaporanHarianModel.isNotEmpty &&
          controller.userPermission.value == 'Hadir') {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor.withOpacity(0.05)),
          child: Obx(() => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.showCurrentLaporanHarianModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReportWidget(
                    no: index + 1,
                    text:
                        '${controller.showCurrentLaporanHarianModel[index].activity}',
                    point:
                        '${controller.showCurrentLaporanHarianModel[index].grade}',
                  );
                },
              )),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.15,
          ),
          child: CommonNoData(
            title: 'Tidak Ada Laporan',
            subTitle: 'Tanggal yg kamu pilih belum ada laporan',
            image: 'assets/images/imgReportEmpty.svg',
          ),
        );
      }
      // if (controller.showCurrentLaporanHarianResponse?.data == null) {
      //   return Padding(
      //     padding: EdgeInsets.only(
      //       bottom: height * 0.15,
      //       top: height * 0.15,
      //     ),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SvgPicture.asset(
      //             'assets/images/imgEmpty.svg',
      //           ),
      //           SizedBox(height: height * 0.01),
      //           AutoSizeText(
      //             'Laporan tidak ditemukan',
      //             group: AutoSizeGroup(),
      //             maxLines: 1,
      //             style: tsBodyMediumSemibold(blackColor),
      //           ),
      //           AutoSizeText(
      //             'Dibulan ini sepertinya belum ada laporan',
      //             group: AutoSizeGroup(),
      //             maxLines: 1,
      //             style: tsLabelLargeRegular(blackColor),
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // } else {
      //   return Container(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: width * 0.035, vertical: height * 0.01),
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         color: secondaryColor.withOpacity(0.05)),
      //     child: Obx(() => ListView.builder(
      //           physics: NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //           itemCount: controller.showCurrentLaporanHarianModel.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return ReportWidget(
      //               no: index + 1,
      //               text:
      //                   '${controller.showCurrentLaporanHarianModel[index].activity}',
      //               point:
      //                   '${controller.showCurrentLaporanHarianModel[index].grade}',
      //             );
      //           },
      //         )),
      //   );
      // }
    });
  }
}
