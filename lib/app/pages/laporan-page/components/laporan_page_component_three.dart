import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_six.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/bottomsheet_pilih_tanggal.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanPageComponentThree extends GetView<LaporanPageController> {
  final DetailLaporanHarianController detailLaporanHarianController =
      Get.put(DetailLaporanHarianController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Laporan Harian\n',
                style: tsTitleSmallRegular(blackColor).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: 'Ananada',
                    style: tsTitleSmallSemibold(secondaryColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.05,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AutoSizeText(
                '${DateFormat('dd MMMM yyyy').format(detailLaporanHarianController.selectedDate.value)}',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallMedium(blackColor),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.035, vertical: height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: opacity5SecondaryColor),
          child: Obx(() {
            if (controller.isLoadingLaporanHarian.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  ReportWidget(
                    no: 1,
                    text: 'Datang tepat pada waktunya',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.datangTepatPadaWaktunya}',
                  ),
                  ReportWidget(
                    no: 2,
                    text: 'Berpakaian rapi',
                    // point: 'B',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.berpakaianRapi}',
                  ),
                  ReportWidget(
                    no: 3,
                    text: 'Berbuat baik dengan teman',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.berbuatBaikDenganTeman}',
                  ),
                  ReportWidget(
                    no: 4,
                    text: 'Mau menolong dan berbagi dengan teman',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.mauMenolongDanBerbagiDenganTeman}',
                  ),
                  ReportWidget(
                    no: 5,
                    text: 'Merapikan alat belajar dan mainan sendiri',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.merapikanAlatBelajarDanMainanSendiri}',
                  ),
                  ReportWidget(
                    no: 6,
                    text: 'Menyelesaikan tugas',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.menyelesaikanTugas}',
                  ),
                  ReportWidget(
                    no: 7,
                    text: 'Membaca',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.membaca}',
                  ),
                  ReportWidget(
                    no: 8,
                    text: 'Menulis',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.menulis}',
                  ),
                  ReportWidget(
                    no: 9,
                    text: 'Dikte',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.dikte}',
                  ),
                  ReportWidget(
                    no: 10,
                    text: 'Keterampilan',
                    point:
                        '${controller.showCurrentLaporanHarianModel.value.keterampilan}',
                  ),
                ],
              );
            }
          }),
        ),
        SizedBox(height: height * 0.02),
        HomePageCompnentSix(),
        SizedBox(height: height * 0.02),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheetPilihTanggal(),
              isScrollControlled: true,
              backgroundColor: whiteColor,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Pilih Tanggal',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(whiteColor),
              ),
              SizedBox(width: width * 0.03),
              Icon(
                Icons.calendar_today_rounded,
                size: 15,
                color: whiteColor,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: blackColor,
            minimumSize: Size(
              width,
              height * 0.06,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
