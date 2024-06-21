import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class TugasWidget extends StatelessWidget {
  final Color color;
  final String type;
  final String title;
  const TugasWidget(
      {super.key,
      required this.color,
      required this.type,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: AutoSizeText.rich(
                  textAlign: TextAlign.start,
                  TextSpan(text: type, style: tsBodySmallSemibold(whiteColor)),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 12),
            ],
          ),
          SizedBox(height: 20),
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(text: title, style: tsBodyMediumSemibold(blackColor)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 1,
            width: double.infinity,
            color: opacity20GreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                        text: 'Dibuat pada :',
                        style: tsBodySmallRegular(greyColor)),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconCalender,
                        color: color,
                      ),
                      SizedBox(width: 5),
                      AutoSizeText.rich(
                        TextSpan(
                            text: 'Senin, 20\nDecember',
                            style: tsBodySmallSemibold(blackColor)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text: 'Tenggat Waktu :',
                            style: tsBodySmallRegular(greyColor)),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SvgPicture.asset(
                            iconCalender,
                            color: dangerColor,
                          ),
                          SizedBox(width: 5),
                          AutoSizeText.rich(
                            TextSpan(
                                text: 'Rabu, 23\nDecember',
                                style: tsBodySmallSemibold(blackColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.06,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
