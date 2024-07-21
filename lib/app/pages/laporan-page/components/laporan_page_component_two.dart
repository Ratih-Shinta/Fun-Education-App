import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/laporan_container.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class LaporanPageComponentTwo extends GetView<LaporanPageController> {
  final DetailLaporanHarianController detailLaporanHarianController =
      Get.put<DetailLaporanHarianController>(DetailLaporanHarianController());
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Obx(() {
      if (controller.isLoading.value == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
      if (detailLaporanHarianController.showCurrentLaporanHarianResponse?.totalPoint == null) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: height * 0.15,
            top: height * 0.15,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/imgTidakAdaLaporan.svg',
                ),
                SizedBox(height: height * 0.01),
                AutoSizeText(
                  'Belum Ada Laporan',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsBodyMediumSemibold(blackColor),
                ),
                AutoSizeText(
                  'Untuk Tanggal Tersebut Belum Ada Laporan',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsLabelLargeRegular(blackColor),
                ),
              ],
            ),
          ),
        );
      } else {
        return InkWell(
          onTap: () => Get.toNamed(Routes.DETAIL_LAPORAN_HARIAN_PAGE),
          child: LaporanContainer(
              detailLaporanHarianController
                  .showCurrentLaporanHarianResponse!.totalPoint
                  .toString(),
              '1'),
        );
      }
    });
  }
}
