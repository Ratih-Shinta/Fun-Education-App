import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/tugas_widget.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class HomePageComponentFour extends GetView<HomePageController> {
  HomePageComponentFour({super.key});

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
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.showCurrentTugasModel.isEmpty) {
            return CommonNoData(
              image: 'assets/images/imgEmpty.svg',
                title: 'Tidak Ada Tugas Terbaru',
                subTitle: 'Tidak Ada Tugas Terbaru Saat Ini');
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  controller.showCurrentTugasModel.length,
              itemBuilder: (BuildContext context, int index) {
                return TugasWidget(
                  controllerArguments:
                      controller.showCurrentTugasModel[index],
                );
              },
            );
          }
        })
      ],
    );
  }
}
