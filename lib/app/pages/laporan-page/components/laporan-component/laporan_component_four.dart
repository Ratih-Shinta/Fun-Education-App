import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/commont_no_data.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tab_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LaporanComponentFour extends GetView<LaporanPageController> {
  LaporanComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
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
          height: height * 5,
          child: TabBarView(
            children: [
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.showCurrentTugasModelTerbaru.isEmpty) {
                    return CommontNoData(
                        title: 'Tidak Ada Tugas Terbaru',
                        subTitle: 'Tidak Ada Tugas Terbaru Saat Ini');
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.showCurrentTugasModelTerbaru.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelTerbaru[index],
                          category:
                              '${controller.showCurrentTugasModelTerbaru[index].category}',
                          title:
                              '${controller.showCurrentTugasModelTerbaru[index].title}',
                          status:
                              '${controller.showCurrentTugasModelTerbaru[index].statusTugasUser}',
                        );
                      },
                    );
                  }
                },
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller
                      .showCurrentTugasModelDiperiksa.isEmpty) {
                    return CommontNoData(
                        title: 'Tidak Ada Tugas Diperiksa',
                        subTitle: 'Tidak Ada Tugas Diperiksa Saat Ini');
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.showCurrentTugasModelDiperiksa.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelDiperiksa[index],
                          category:
                              '${controller.showCurrentTugasModelDiperiksa[index].category}',
                          title:
                              '${controller.showCurrentTugasModelDiperiksa[index].title}',
                          status:
                              '${controller.showCurrentTugasModelDiperiksa[index].statusTugasUser}',
                        );
                      },
                    );
                  }
                },
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.showCurrentTugasModelSelesai.isEmpty) {
                    return CommontNoData(
                        title: 'Tidak Ada Tugas Selesai',
                        subTitle: 'Tidak Ada Tugas Selesai Saat Ini');
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.showCurrentTugasModelSelesai.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TugasWidget(
                          controllerArguments:
                              controller.showCurrentTugasModelSelesai[index],
                          category:
                              '${controller.showCurrentTugasModelSelesai[index].category}',
                          title:
                              '${controller.showCurrentTugasModelSelesai[index].title}',
                          status:
                              '${controller.showCurrentTugasModelSelesai[index].statusTugasUser}',
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
