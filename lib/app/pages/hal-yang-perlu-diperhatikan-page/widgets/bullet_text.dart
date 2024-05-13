import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class BulletText extends StatelessWidget {
  final Color? boldTextColor;
  final String? boldText;
  final String text;

  const BulletText(
      {super.key, required this.text, this.boldTextColor, this.boldText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          AutoSizeText.rich(
            TextSpan(
                text: '• ',
                style: tsBodySmallRegular(boldTextColor ?? blackColor)),
          ),
          AutoSizeText.rich(
            group: AutoSizeGroup(),
            maxLines: 2,
            TextSpan(
              text: boldText,
              style: tsBodySmallSemibold(boldTextColor ?? blackColor),
              children: [
                TextSpan(
                  text: text,
                  style: tsBodySmallRegular(blackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
