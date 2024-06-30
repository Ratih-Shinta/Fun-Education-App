import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class CustomRadioButton extends GetView<SavingPageController> {
  final String title;
  final String subtitle;
  final String icon;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final TextStyle? style;

  CustomRadioButton(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText.rich(
            TextSpan(
              text: '${title}\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: subtitle,
                  style: style ?? tsBodySmallRegular(successColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: opacity10GreyColor),
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: groupValue == value ? primaryColor : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
