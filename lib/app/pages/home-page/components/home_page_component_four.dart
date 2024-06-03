import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:intl/intl.dart';

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
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.05,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AutoSizeText(
            '${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallMedium(blackColor),
          ),
        ),
      ],
    );
  }
}
