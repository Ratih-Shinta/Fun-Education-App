import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageComponentFour extends StatelessWidget {
  const HomePageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.42,
          child: AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Laporan Harian\n',
              style: tsTitleSmallRegular(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Ananada',
                  style: tsTitleSmallSemibold(secondaryColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 4.5, bottom: 8),
            padding:
                EdgeInsets.symmetric(vertical: 7, horizontal: width * 0.03),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(10)),
            child: AutoSizeText.rich(
              TextSpan(
                  text: 'Senin, 25 Maret 2024',
                  style: tsBodySmallMedium(blackColor)),
            )),
      ],
    );
  }
}
