import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_penjelasan_shift_masuk.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageComponentOne extends StatelessWidget {
  const HomePageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Halo Ananda,\n',
              style: tsBodySmallRegular(whiteColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Radya Hukma S.H',
                  style: tsBodyMediumSemibold(whiteColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: height * 0.015),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.access_time_filled,
                        color: primaryColor,
                      ),
                    ),
                    AutoSizeText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: 'Shift Masuk\n',
                        style: tsBodySmallRegular(whiteColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: '08.00 - 10.00',
                            style: tsBodyMediumSemibold(whiteColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomsheetPenjelasanShiftMasuk();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: 'Lihat Penjelasan',
                            style: tsLabelLargeRegular(whiteColor)),
                        maxLines: 2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: whiteColor,
                        size: 12,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          CommonWarning(
              backColor: opacityWhiteColor,
              icon: Icons.info_outline,
              text:
                  'Shift masuk akan berganti seiring perkembangan belajar anak')
        ],
      ),
    );
  }
}
