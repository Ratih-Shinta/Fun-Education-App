import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonWarning extends StatelessWidget {
  final Color backColor;
  final IconData? icon; // Changed from Icons? to IconData?
  final String text;

  CommonWarning({
    Key? key,
    required this.backColor,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backColor,
      ),
      child: Row(
        children: [
          if (icon != null) // Check if icon is provided
            Icon(
              icon,
              color: whiteColor,
            ),
          if (icon != null) // Check if icon is provided
            SizedBox(width: 10),
          Flexible(
            child: AutoSizeText(
              text,
              maxLines: 5,
              style: tsLabelLargeMedium(whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
