import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class DetailLaporanComponentThree extends StatelessWidget {
  const DetailLaporanComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor.withOpacity(0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            TextSpan(
                text: 'Keterangan:', style: tsBodyMediumSemibold(blackColor)),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.007, horizontal: width * 0.047),
                    decoration: BoxDecoration(
                      color: successColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'A',
                      style: tsBodySmallSemibold(whiteColor),
                    ),
                  ),
                  Text(
                    ':  Sangat Baik',
                    style: tsBodySmallMedium(blackColor),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.007, horizontal: width * 0.047),
                decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '10 Poin',
                  style: tsBodySmallSemibold(whiteColor),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.007, horizontal: width * 0.047),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'B',
                      style: tsBodySmallSemibold(whiteColor),
                    ),
                  ),
                  Text(
                    ':  Baik',
                    style: tsBodySmallMedium(blackColor),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.007, horizontal: width * 0.047),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '4 Poin',
                  style: tsBodySmallSemibold(whiteColor),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.007, horizontal: width * 0.047),
                    decoration: BoxDecoration(
                      color: warningColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'C',
                      style: tsBodySmallSemibold(whiteColor),
                    ),
                  ),
                  Text(
                    ':  Kurang',
                    style: tsBodySmallMedium(blackColor),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.007, horizontal: width * 0.047),
                decoration: BoxDecoration(
                  color: warningColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '3 Poin',
                  style: tsBodySmallSemibold(whiteColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
