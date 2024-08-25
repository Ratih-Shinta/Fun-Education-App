// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool? isLoading;
  final String? svgIcon;

  CommonButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.icon,
    this.isLoading, this.svgIcon,
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
        height: height * 0.068,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading == true
                ? SizedBox(
                    child: CircularProgressIndicator(
                      color: whiteColor,
                    ),
                  )
                : isLoading == null
                    ? AutoSizeText.rich(
                        TextSpan(
                          text: text,
                          style: tsBodySmallSemibold(textColor),
                        ),
                      )
                    : AutoSizeText.rich(
                        TextSpan(
                          text: text,
                          style: tsBodySmallSemibold(textColor),
                        ),
                      ),
            if (icon != null) ...[
              SizedBox(width: 10),
              Icon(
                icon,
                color: textColor,
                size: 18,
              ),
            ],
            if (svgIcon != null) ...[
              SizedBox(width: 10),
              SvgPicture.asset(
                svgIcon!,
                color: textColor,
                width: 18,
              )
            ],
          ],
        ),
      ),
    );
  }
}
