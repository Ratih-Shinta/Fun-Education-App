import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_diperiksa.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_gagal.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_kirim.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_selesai.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailTugasPageView extends StatelessWidget {
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  final argument = Get.arguments;

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
              'Detail Tugas',
              style: tsBodyLargeSemibold(blackColor),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02),
              child: Obx(() {
                if (laporanPageController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (argument.statusTugasUser == null) {
                  return DetailTugasKirim();
                } else if (argument.statusTugasUser == 'Diperiksa') {
                  return DetailTugasDiperiksa();
                } else if (argument.statusTugasUser == 'Selesai') {
                  return DetailTugasSelesai();
                } else {
                  return DetailTugasGagal();
                }
              })),
        ));
  }
}
