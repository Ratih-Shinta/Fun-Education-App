import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class UserDataContainer extends StatelessWidget {
  final String title;
  final String content;
   UserDataContainer({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: height * 0.027, horizontal: width * 0.057),
      decoration: BoxDecoration(
          color: opacityBlackColor, borderRadius: BorderRadius.circular(10)),
      child: AutoSizeText.rich(
        textAlign: TextAlign.start,
        TextSpan(
          text: '$title\n',
          style: tsBodySmallRegular(blackColor),
          children: [
            TextSpan(
              text: content,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
