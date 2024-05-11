import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageCompnentSix extends StatelessWidget {
  const HomePageCompnentSix({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.035, vertical: height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: opacity5SecondaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            TextSpan(
                text: 'Keterangan:', style: tsBodyMediumSemibold(blackColor)),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.007, horizontal: width * 0.047),
                    decoration: BoxDecoration(
                      color: greenColor,
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
              SizedBox(width: width * 0.15),
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
              )
            ],
          ),
          SizedBox(height: height * 0.01),
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
          )
        ],
      ),
    );
  }
}
