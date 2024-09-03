import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DetailLaporanComponentTwo extends GetView<DetailLaporanHarianController> {
  DetailLaporanComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(() {
      if (controller.isLoading.value == true) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: height * 0.7,
            width: width,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
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
    });
  }
}
