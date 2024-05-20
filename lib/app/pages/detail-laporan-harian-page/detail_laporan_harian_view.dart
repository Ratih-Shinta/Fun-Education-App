import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/widgets/report_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

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
                      '17 November 2021',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallMedium(blackColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Container(
                width: width,
                height: height * 0.00125,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: height * 0.04),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.035,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: opacity5SecondaryColor,
                ),
                child: Column(
                  children: [
                    ReportWidget(
                      no: 1,
                      text: 'Datang tepat pada waktunya',
                      point: 'A',
                      pointColor: greenColor,
                    ),
                    ReportWidget(
                      no: 2,
                      text: 'Berpakaian rapi',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 3,
                      text: 'Berbuat baik dengan teman',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 4,
                      text: 'Mau menolong dan berbagi dengan teman',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 5,
                      text: 'Merapikan alat belajar dan mainan sendiri',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 6,
                      text: 'Menyelesaikan tugas',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 7,
                      text: 'Membaca',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 8,
                      text: 'Menulis',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 9,
                      text: 'Dikte',
                      point: 'B',
                      pointColor: blueColor,
                    ),
                    ReportWidget(
                      no: 10,
                      text: 'Keterampilan',
                      point: 'C',
                      pointColor: warningColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.035,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: opacity5SecondaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Keterangan:',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodyMediumSemibold(blackColor),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: width * 0.02),
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.007,
                                horizontal: width * 0.047,
                              ),
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AutoSizeText(
                                'A',
                                group: AutoSizeGroup(),
                                maxLines: 1,
                                style: tsBodySmallSemibold(whiteColor),
                              ),
                            ),
                            AutoSizeText(
                              ':  Sangat Baik',
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              style: tsBodySmallMedium(blackColor),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.15),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: width * 0.02),
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.007,
                                horizontal: width * 0.047,
                              ),
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AutoSizeText(
                                'B',
                                group: AutoSizeGroup(),
                                maxLines: 1,
                                style: tsBodySmallSemibold(whiteColor),
                              ),
                            ),
                            AutoSizeText(
                              ':  Baik',
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              style: tsBodySmallMedium(blackColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.007,
                            horizontal: width * 0.047,
                          ),
                          decoration: BoxDecoration(
                            color: warningColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AutoSizeText(
                            'C',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(whiteColor),
                          ),
                        ),
                        AutoSizeText(
                          ':  Kurang',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallMedium(blackColor),
                        ),
                      ],
                    )
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
