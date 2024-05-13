import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class FunEducation extends StatelessWidget {
  const FunEducation({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logo,
          width: 25,
        ),
        Text(
          textAlign: TextAlign.center,
          'FunEducation',
          style: tsTitleMediumSemibold(primaryColor),
        )
      ],
    );
  }
}
