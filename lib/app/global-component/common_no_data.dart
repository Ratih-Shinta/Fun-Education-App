import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonNoData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const CommonNoData(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 40),
          SvgPicture.asset(image),
          SizedBox(height: 20),
          AutoSizeText.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: '$title\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: '$subTitle',
                  style: tsBodySmallRegular(blackColor),
                ),
              ],
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
