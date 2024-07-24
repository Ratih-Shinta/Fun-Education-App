import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/tugas_widget.dart';
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
        TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: primaryColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerColor: transparentColor,
            labelColor: primaryColor,
            unselectedLabelColor: greyColor,
            tabs: [
              TabItem(title: 'Terbaru', count: 2),
              TabItem(title: 'Diperiksa', count: 3),
              TabItem(title: 'Selesai', count: 5),
            ]),
        SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Obx(() => TabBarView(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.showCurrentTugasModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return TugasWidget(
                    category: '${controller.showCurrentTugasModel[index].category}',
                    title:
                        '${controller.showCurrentTugasModel[index].title}',
                    status: '${controller
                            .showCurrentTugasModel[index].statusTugasUser}',
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    controller.showCurrentTugasModelDiperiksa.length,
                itemBuilder: (BuildContext context, int index) {
                  return TugasWidget(
                    category: controller
                        .showCurrentTugasModelDiperiksa[index].category!,
                    title: controller
                        .showCurrentTugasModelDiperiksa[index].title!,
                    status: controller
                            .showCurrentTugasModelDiperiksa[index].statusTugasUser ??
                        'null',
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    controller.showCurrentTugasModelSelesai.length,
                itemBuilder: (BuildContext context, int index) {
                  return TugasWidget(
                    category: controller
                        .showCurrentTugasModelSelesai[index].category!,
                    title: controller
                        .showCurrentTugasModelSelesai[index].title!,
                    status: controller
                            .showCurrentTugasModelSelesai[index].statusTugasUser ??
                        'null',
                  );
                },
              ),
            ],
          ),)
        )
      ],
    );
  }
}
