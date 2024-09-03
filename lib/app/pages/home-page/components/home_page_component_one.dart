import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageComponentOne extends GetView<HomePageController> {
  const HomePageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: AutoSizeText.rich(
                TextSpan(
                  text: 'Hello,\n',
                  style: tsTitleMediumRegular(blackColor).copyWith(
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text: 'Nickname',
                      style: tsTitleMediumSemibold(blackColor),
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          } else {
            return AutoSizeText.rich(
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
            );
          }
        }),
        Obx(
          () {
            if (controller.isLoading.value) {
              return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: width * 0.35,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                  ));
            } else {
              return Container(
                width: width * 0.35,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                          text: 'Total Point',
                          style: tsBodySmallRegular(whiteColor)),
                    ),
                    Obx(() => IconPoint(
                          point:
                              '${controller.showTotalPointModel.value.point}',
                          color: successColor,
                        ))
                  ],
                ),
              );
            }
          },
        )
      ],
    );
  }
}
