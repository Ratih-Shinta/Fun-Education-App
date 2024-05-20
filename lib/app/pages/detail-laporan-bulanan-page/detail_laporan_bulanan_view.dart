import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailLaporanBulananView extends GetView<DetailLaporanBulananController> {
  const DetailLaporanBulananView({super.key});

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
            'Detail Laporan Bulanan',
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
                      'November 2021',
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
              SizedBox(height: height * 0.03),
              AutoSizeText(
                'Status Perkembangan :',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodyMediumSemibold(blackColor),
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.013,
                  horizontal: width * 0.08,
                ),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AutoSizeText(
                  'Berkembang',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsBodySmallMedium(whiteColor),
                ),
              ),
              SizedBox(height: height * 0.03),
              AutoSizeText(
                'Catatan Dari Guru :',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodyMediumSemibold(blackColor),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width,
                child: AutoSizeText(
                  'Anak anda sudah mulai bisa mengenal angka dan huruf, namun masih perlu bimbingan lebih lanjut terkait pembelajatan semuanya',
                  group: AutoSizeGroup(),
                  style: tsBodySmallRegular(blackColor),
                ),
              ),
              SizedBox(height: height * 0.03),
              AutoSizeText(
                'Hal Yang Perlu Ditingkatkan :',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodyMediumSemibold(blackColor),
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width,
                child: AutoSizeText(
                  'Anak anda sudah mulai bisa mengenal angka dan huruf, namun masih perlu bimbingan lebih lanjut terkait pembelajatan semuanya',
                  group: AutoSizeGroup(),
                  style: tsBodySmallRegular(blackColor),
                ),
              ),
              SizedBox(height: height * 0.04),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                  horizontal: width * 0.06,
                ),
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Merasa Kurang Paham?',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodyMediumBold(whiteColor),
                        ),
                        SizedBox(height: height * 0.005),
                        AutoSizeText(
                          'Konsultasikan dengan guru',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallRegular(whiteColor),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            size: 20,
                            color: blackColor,
                          ),
                          SizedBox(width: width * 0.03),
                          AutoSizeText(
                            'Konsultasi Sekarang',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(blackColor),
                          ),
                          SizedBox(width: width * 0.03),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: blackColor,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteColor,
                        minimumSize: Size(
                          width,
                          height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
