import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class FunEducation extends StatelessWidget {
  final double width;
  final TextStyle textStyle;

  const FunEducation({
    super.key,
    required this.width,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logo,
          width: width,
        ),
        SizedBox(width: width * 0.2),
        Text(
          textAlign: TextAlign.center,
          'FunEducation',
          style: textStyle,
        )
      ],
    );
  }
}
