import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tab_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shimmer/shimmer.dart';

class LaporanPageComponentFour extends GetView<LaporanPageController> {
  LaporanPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/icTaskList.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(text: 'Tugas', style: tsBodyMediumSemibold(blackColor)),
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(() => TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: primaryColor,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                dividerColor: transparentColor,
                labelColor: primaryColor,
                unselectedLabelColor: greyColor,
                tabs: [
                  TabItem(
                      title: 'Terbaru',
                      count: controller.showCurrentTugasModelTerbaru.length),
                  TabItem(
                      title: 'Diperiksa',
                      count: controller.showCurrentTugasModelDiperiksa.length),
                  TabItem(
                      title: 'Selesai',
                      count: controller.showCurrentTugasModelSelesai.length),
                ])),
        SizedBox(height: 20),
        SizedBox(
          // Expanded(
          height: height * 4,
          child: TabBarView(
            children: [
              Obx(
                () {
                  if (controller.isLoadingTask.value) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: width,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    );
                  } else if (controller.showCurrentTugasModelTerbaru.isEmpty) {
                    return CommonNoData(
                      title: 'Tidak Ada Tugas Terbaru',
                      subTitle: 'Tidak Ada Tugas Terbaru Saat Ini',
                      image: 'assets/images/imgEmpty.svg',
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.showCurrentTugasModelTerbaru.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelTerbaru[index],
                        );
                      },
                    );
                  }
                },
              ),
              Obx(
                () {
                  if (controller.isLoadingTask.value) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: width,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    );
                  } else if (controller
                      .showCurrentTugasModelDiperiksa.isEmpty) {
                    return CommonNoData(
                      title: 'Tidak Ada Tugas Diperiksa',
                      subTitle: 'Tidak Ada Tugas Diperiksa Saat Ini',
                      image: 'assets/images/imgEmpty.svg',
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.showCurrentTugasModelDiperiksa.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelDiperiksa[index],
                        );
                      },
                    );
                  }
                },
              ),
              Obx(
                () {
                  if (controller.isLoadingTask.value) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            width: width,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    );
                  } else if (controller.showCurrentTugasModelSelesai.isEmpty) {
                    return CommonNoData(
                      title: 'Tidak Ada Tugas Selesai',
                      subTitle: 'Tidak Ada Tugas Selesai Saat Ini',
                      image: 'assets/images/imgEmpty.svg',
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.showCurrentTugasModelSelesai.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelSelesai[index],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
