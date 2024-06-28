import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/home-page/components/home_page_component_six.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
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
            'Detail Laporan',
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
              AutoSizeText.rich(
                group: AutoSizeGroup(),
                TextSpan(
                  text:
                      '${DateFormat('EEEE').format(controller.selectedDate.value)}, ',
                  style: tsBodyLargeSemibold(blackColor).copyWith(
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '${DateFormat('dd MMMM yyyy').format(controller.selectedDate.value)}',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
                maxLines: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconPoint(
                      point: '100',
                      color: successColor,
                      textStyle: tsBodySmallSemibold(whiteColor),
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Sangat Baik',
                        style: tsBodySmallRegular(whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
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
              SizedBox(height: height * 0.02),
              AutoSizeText.rich(
                TextSpan(
                  text: 'Catatan Guru :',
                  style: tsBodyMediumSemibold(blackColor),
                ),
              ),
              Container(
                  width: width,
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: opacity5GreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() {
                    if (controller.showCurrentLaporanHarianModel.value
                            .berbuatBaikDenganTeman ==
                        null) {
                      return AutoSizeText.rich(
                        TextSpan(
                          text: 'Tidak ada catatan',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      );
                    } else {
                      return AutoSizeText.rich(
                        TextSpan(
                          text:
                              'Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak. Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak.',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      );
                    }
                  })),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Merasa Kurang Paham?',
                        style: tsBodyMediumBold(whiteColor),
                      ),
                    ),
                    SizedBox(height: 5),
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Konsultasikan dengan guru',
                        style: tsBodySmallRegular(whiteColor),
                      ),
                    ),
                    SizedBox(height: 24),
                    InkWell(
                      onTap: () {
                        // Button action
                      },
                      child: Container(
                        width: width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: whiteColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              iconChat,
                              color: blackColor,
                            ),
                            SizedBox(width: 5),
                            AutoSizeText.rich(
                              TextSpan(
                                text: 'Konsultasi',
                                style: tsBodySmallSemibold(blackColor),
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
