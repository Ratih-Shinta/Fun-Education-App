import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class HomePageComponentFive extends GetView<HomePageController> {
  const HomePageComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: opacity5SecondaryColor),
      child: Obx(
        () => Column(
          children: [
            ReportWidget(
                no: 1,
                text: 'Datang tepat pada waktunya',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.datangTepatPadaWaktunya}',
                pointColor: greenColor),
            ReportWidget(
                no: 2,
                text: 'Berpakaian rapi',
                // point: 'B',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.berpakaianRapi}',
                pointColor: blueColor),
            ReportWidget(
                no: 3,
                text: 'Berbuat baik dengan teman',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.berbuatBaikDenganTeman}',
                pointColor: blueColor),
            ReportWidget(
                no: 4,
                text: 'Mau menolong dan berbagi dengan teman',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.mauMenolongDanBerbagiDenganTeman}',
                pointColor: blueColor),
            ReportWidget(
                no: 5,
                text: 'Merapikan alat belajar dan mainan sendiri',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.merapikanAlatBelajarDanMainanSendiri}',
                pointColor: blueColor),
            ReportWidget(
                no: 6,
                text: 'Menyelesaikan tugas',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.menyelesaikanTugas}',
                pointColor: blueColor),
            ReportWidget(
                no: 7,
                text: 'Membaca',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.membaca}',
                pointColor: blueColor),
            ReportWidget(
                no: 8,
                text: 'Menulis',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.menulis}',
                pointColor: blueColor),
            ReportWidget(
                no: 9,
                text: 'Dikte',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.dikte}',
                pointColor: blueColor),
            ReportWidget(
                no: 10,
                text: 'Keterampilan',
                point:
                    '${controller.showCurrentLaporanHarianModel.value.keterampilan}',
                pointColor: warningColor),
          ],
        ),
      ),
    );
  }
}
