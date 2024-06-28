import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class IconPoint extends StatelessWidget {
  final String point;
  final Color color;
  final TextStyle? textStyle;
  const IconPoint({super.key, required this.point, required this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: color,
              ),
            ),
          ),
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
