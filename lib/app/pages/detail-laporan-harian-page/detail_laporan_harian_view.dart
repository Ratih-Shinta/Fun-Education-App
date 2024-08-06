import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/components/detail_component_five.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/components/detail_laporan_component_four.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/components/detail_laporan_component_one.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/components/detail_laporan_component_three.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/components/detail_laporan_component_two.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
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
            'Detail Laporan',
            style: tsBodyLargeSemibold(blackColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailLaporanComponentOne(),
              DetailLaporanComponentTwo(),
              SizedBox(height: height * 0.02),
              DetailLaporanComponentThree(),
              SizedBox(height: height * 0.02),
              DetailLaporanComponentFour(),
              // DetailComponentFive(),
            ],
          ),
        ),
      ),
    );
  }
}
