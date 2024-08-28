import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/bullet_text.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/header_bottomsheet.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetPenjelasanShiftMasuk extends GetView<HomePageController> {
  const BottomsheetPenjelasanShiftMasuk({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
        height: height * 0.62,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.03, horizontal: width * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderBottomsheet(
                          title: 'Jam Belajar Siswa',
                          subtitle: 'Shift Masuk',
                          color: warningColor),
                      SizedBox(height: height * 0.03),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText.rich(
                              TextSpan(
                                text: 'Pertemuan belajar, hari Senin s/d Kamis',
                                style: tsBodySmallSemibold(blackColor),
                              ),
                            ),
                            SizedBox(height: 10),
                            BulletText(text: 'Jam 08.00 – 10.00'),
                            BulletText(text: 'Jam 10.00 – 11.30'),
                            BulletText(text: 'Jam 11.30 – 13.00'),
                            BulletText(text: 'Jam 13.00 – 14.00'),
                            BulletText(text: 'Jam 14.00 – 15.00'),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.02),
                          decoration: BoxDecoration(
                            color: warningColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AutoSizeText(
                            'Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak.',
                            maxLines: 5,
                            style: tsBodySmallSemibold(whiteColor),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonButton(
                    isLoading: controller.isLoading.value,
                    text: 'Tutup',
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
