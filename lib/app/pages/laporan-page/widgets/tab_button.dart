import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TabButton extends GetView<LaporanPageController> {
  final String title;
  final int index;
  const TabButton({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return GestureDetector(
      onTap: () {
        controller.changeTab(index);
      },
      child: Obx(() {
        return Container(
          width: width * 0.435,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: controller.currentIndex.value == index
                ? whiteColor
                : transparentColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: AutoSizeText.rich(
              TextSpan(
                text: title,
                style: controller.currentIndex.value == index
                    ? tsBodySmallSemibold(blackColor)
                    : tsBodySmallSemibold(greyColor),
              ),
            ),
          ),
        );
      }),
    );
  }
}
