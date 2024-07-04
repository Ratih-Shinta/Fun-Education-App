import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HeaderBottomsheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const HeaderBottomsheet({super.key, required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
              margin: EdgeInsets.only(right: width * 0.02),
              width: width * 0.016,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            AutoSizeText.rich(
              TextSpan(
                text: '$title\n',
                style: tsBodyMediumSemibold(blackColor).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: '$subtitle',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
              maxLines: 2,
            ),
          ],
        ),
      ],
    );
  }
}