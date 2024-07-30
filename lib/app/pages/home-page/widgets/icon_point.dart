import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class IconPoint extends StatelessWidget {
  final String point;
  final Color color;
  final TextStyle? textStyle;
  const IconPoint({Key? key, required this.point, required this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/icDiamond.svg',
        ),
        AutoSizeText.rich(
          TextSpan(
            text: '${point} Poin',
            style: textStyle ?? tsBodyMediumSemibold(whiteColor),
          ),
        ),
      ],
    );
  }
}
