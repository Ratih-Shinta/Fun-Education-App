import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_penjelasan_shift_masuk.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class HomePageComponentTwo extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return BottomsheetPenjelasanShiftMasuk();
          },
          isScrollControlled: true,
          backgroundColor: whiteColor,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: height * 0.02,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 9),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.access_time_filled,
                    color: whiteColor,
                  ),
                ),
                SizedBox(width: 3),
                Obx(
                  () => AutoSizeText.rich(
                    TextSpan(
                      text: 'Shift Masuk\n',
                      style: tsBodySmallRegular(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${controller.showCurrentUserModel.value.shift}',
                          style: tsBodyMediumSemibold(blackColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: blackColor,
              size: 17,
            )
          ],
        ),
      ),
    );
  }
}
