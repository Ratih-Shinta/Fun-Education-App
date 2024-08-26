import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommontNoData extends StatelessWidget {
  final String title;
  final String subTitle;
  const CommontNoData({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        SvgPicture.asset('assets/images/imgEmpty.svg'),
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
          maxLines: 2,
        ),
      ],
    );
  }
}
