import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final String value;
  final String groupValue;
  final Function(String) onChanged;

  CustomRadioButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(icon),
                ),
                SizedBox(width: 10.0),
                AutoSizeText.rich(
                  TextSpan(
                    text: '${title}\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: subtitle,
                        style: tsBodySmallRegular(greenColor),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: opacityGreyColor),
              child: Container(
                width: 21.0,
                height: 21.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      groupValue == value ? primaryColor : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
