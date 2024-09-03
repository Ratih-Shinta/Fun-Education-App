import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CustomRadioButtonPeriod extends StatelessWidget {
  const CustomRadioButtonPeriod({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.style,
  }) : super(key: key);
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: style ?? tsBodyMediumSemibold(blackColor),
            ),
            Icon(
              Icons.check_circle,
              color: groupValue == value ? successColor : transparentColor,
            )
          ],
        ),
      ),
    );
  }
}
