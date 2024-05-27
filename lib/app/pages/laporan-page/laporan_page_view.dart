import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_page_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_page_component_three.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_page_component_two.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageView extends GetView<LaporanPageController> {
  const LaporanPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  TextSpan(
                    text: 'Alur Belajar ',
                    style: tsTitleSmallRegular(blackColor),
                    children: [
                      TextSpan(
                        text: 'Ananda',
                        style: tsTitleSmallSemibold(blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                LaporanPageComponentOne(),
                SizedBox(height: height * 0.02),
                CommonWarning(
                  icon: Icons.info_outline_rounded,
                  backColor: warningColor,
                  text:
                      'Yang anda lihat sekarang adalah laporan\nuntuk hari ini, pilih tanggal untuk melihat\nlaporan dihari yang lainnya',
                ),
                SizedBox(height: height * 0.04),
                LaporanPageComponentTwo(),
                SizedBox(height: height * 0.05),
                LaporanPageComponentThree(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
