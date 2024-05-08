import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;

  CommonButton(
      {Key? key,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: tsBodyMediumSemibold(whiteColor),
      ),
    );
  }
}
