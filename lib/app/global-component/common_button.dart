import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? textColor;

  CommonButton({
    Key? key,
    required this.text,
    required this.color,
    this.onPressed,
    this.icon, this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText.rich(
              TextSpan(
                text: text,
                style: tsBodySmallSemibold(textColor ?? whiteColor),
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 10),
              Icon(
                icon,
                color: textColor ?? whiteColor,
                size: 18,
              ),
            ],
          ],
        ),
      ),
    );
  }
}