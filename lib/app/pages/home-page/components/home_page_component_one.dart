import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class HomePageComponentOne extends GetView<HomePageController> {
  const HomePageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: 'Hello,\n',
            style: tsTitleMediumRegular(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: '${controller.showCurrentUserModel.value.nickname}',
                style: tsTitleMediumSemibold(blackColor),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
          // width: width * 0.35,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: successColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText.rich(
                TextSpan(
                    text: 'Total Point', style: tsBodySmallRegular(whiteColor)),
              ),
              IconPoint(
                point: '${controller.showTotalPointModel.value.point}',
                color: successColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
