import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class ReportWidget extends StatelessWidget {
  final int no;
  final String text;
  final String point;
  final Color pointColor;

  const ReportWidget({
    super.key,
    required this.no,
    required this.text,
    required this.point,
    required this.pointColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: width * 0.03),
                width: width * 0.074,
                height: height * 0.044,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: whiteColor),
                child: Text(no != '' ? no.toString() : 'No number provided',
                    style: tsBodySmallSemibold(blackColor)),
              ),
              Container(
                width: width * 0.5,
                child: AutoSizeText.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    text: text,
                    style: tsBodySmallMedium(blackColor),
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.16,
            height: height * 0.044,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: pointColor),
            child: Text(
              point,
              style: tsBodySmallSemibold(whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
