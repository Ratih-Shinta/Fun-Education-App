import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class ButtonChip extends StatelessWidget {
  final String text;

  const ButtonChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.023, bottom: height * 0.017),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.008,
        horizontal: width * 0.065,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AutoSizeText.rich(
        textAlign: TextAlign.center,
        TextSpan(text: text, style: tsBodySmallSemibold(whiteColor)),
      ),
    );
  }
}
