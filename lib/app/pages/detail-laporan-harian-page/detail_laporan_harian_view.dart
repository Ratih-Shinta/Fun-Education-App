import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_six.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/report_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLaporanHarianView extends GetView<DetailLaporanHarianController> {
  const DetailLaporanHarianView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: AutoSizeText(
            group: AutoSizeGroup(),
            maxLines: 1,
            'Detail Laporan Harian',
            style: tsBodyLargeSemibold(blackColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FunEducation(
                    width: width * 0.08,
                    textStyle: tsBodyLargeSemibold(primaryColor),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width * 0.04,
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
                      '${DateFormat('dd MMMM yyyy').format(controller.selectedDate.value)}',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallMedium(blackColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Obx(() {
                if (controller.isLoading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.showCurrentLaporanHarianModel.value
                        .berbuatBaikDenganTeman ==
                    null) {
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
                            'assets/notFoundImage.svg',
                          ),
                          SizedBox(height: height * 0.01),
                          AutoSizeText(
                            'Laporan tidak ditemukan',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodyMediumSemibold(blackColor),
                          ),
                          AutoSizeText(
                            'Dibulan ini sepertinya belum ada laporan',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsLabelLargeRegular(blackColor),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.035, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: opacity5SecondaryColor),
                    child: Column(
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
                    ),
                  );
                }
              }),
              SizedBox(height: height * 0.02),
              HomePageCompnentSix(),
            ],
          ),
        ),
      ),
    );
  }
}
