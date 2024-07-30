import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfileComponentOne extends StatelessWidget {
  ProfileComponentOne({super.key});
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: greyColor,
            ),
            SizedBox(width: width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Radya',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsBodyLargeSemibold(blackColor),
                ),
                Container(
                  width: width * 0.6,
                  child: AutoSizeText(
                    'Radya Hukma Shabiyya Harbani',
                    // overflow: TextOverflow.ellipsis,
                    style: tsBodySmallRegular(blackColor),
                    maxLines: 5,
                  ),
                )
                // AutoSizeText(
                //   'Radya Hukma Shabiyya Harbani',
                //   overflow: TextOverflow.ellipsis,
                //   style: tsBodySmallRegular(blackColor),
                // ),
              ],
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.44,
              height: height * 0.11,
              decoration: BoxDecoration(
                color: opacity10BlueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Total Tabungan',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(blackColor),
                  ),
                  AutoSizeText(
                    'Rp. 1.000.000',
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.44,
              height: height * 0.11,
              decoration: BoxDecoration(
                color: greenColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Total Point',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(blackColor),
                  ),
                  AutoSizeText(
                    '${homePageController.showTotalPointModel.value.point}',
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
