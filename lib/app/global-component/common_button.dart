import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  CommonButton({Key? key, required this.text, required this.onPressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: tsBodyMediumSemibold(whiteColor),
        ),
      ),
    );
  }
}
