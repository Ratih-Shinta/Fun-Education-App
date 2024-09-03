import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_diperiksa.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_kirim.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/components/detail_tugas_selesai.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/detail_tugas_page_controller.dart';
import 'package:fun_education_app/app/pages/detail-tugas-page/widgets/tugas_container.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class DetailTugasPageView extends GetView<DetailTugasPageController> {
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
              size: 15,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: AutoSizeText(
            'Detail Tugas',
            style: tsBodyMediumSemibold(blackColor),
          ),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showCurrentTugasUser(Get.arguments.id);
          await controller.showByIdTugas(Get.arguments.id);
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Completed',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.02),
            child: Column(
              children: [
                Obx(
                  () {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: height * 0.5,
                          width: width,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    } else {
                      return TugasContainer();
                    }
                  },
                ),
                Obx(() {
                  switch (controller.showCurrentTugasUserModel.value.status) {
                    case 'Gagal':
                      return CommonNoData(
                          image: 'assets/images/imgEmpty.svg',
                          title: 'Ananda Tidak Mengerjakan Tugas',
                          subTitle: 'Selalu Periksa Tenggat Waktu');
                    case 'Diperiksa':
                      return DetailTugasDiperiksa();
                    case 'Selesai':
                      return DetailTugasSelesai();
                    default:
                      return DetailTugasKirim();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
