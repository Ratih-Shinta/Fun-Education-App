import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/bullet_text.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class BottomsheetPenjelasanShiftMasuk extends StatelessWidget {
  const BottomsheetPenjelasanShiftMasuk({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
        child: Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.03, horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            width: width * 0.15,
            height: height * 0.008,
            decoration: BoxDecoration(
              color: opacity20GreyColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: width * 0.016,
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: warningColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: 'Jam Belajar Siswa\n',
                  style: tsBodyMediumSemibold(blackColor).copyWith(
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text: 'Shift Masuk',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Center(
            child: Column(
              children: [
                AutoSizeText.rich(
                  TextSpan(
                      text: 'Pertemuan belajar, hari Senin s/d Kamis',
                      style: tsBodySmallSemibold(blackColor)),
                ),
                BulletText(text: 'Jam 08.00 – 10.00'),
                BulletText(text: 'Jam 10.00 – 11.30'),
                BulletText(text: 'Jam 11.30 – 13.00'),
                BulletText(text: 'Jam 13.00 – 14.00'),
              ],
            ),
          ),
          BulletText(text: 'Jam 14.00 – 15.00'),
          Container(
              margin:
                  EdgeInsets.symmetric(vertical: height * 0.03),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02),
              decoration: BoxDecoration(
                color: warningColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flexible(
                child: AutoSizeText(
                  'Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak.',
                  maxLines: 5,
                  style: tsBodySmallSemibold(whiteColor),
                ),
              )),

          CommonButton(text: 'Tutup', onPressed: () => Navigator.pop(context))
        ],
      ),
    ));
  }
}