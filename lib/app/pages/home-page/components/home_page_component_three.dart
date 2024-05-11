import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class HomePageComponentThree extends StatelessWidget {
  const HomePageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgPicture.asset(
                  iconDocument,
                ),
              ),
              Text(
                'Penting Untuk Dibaca!',
                style: tsBodySmallMedium(blackColor),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            'Hal - hal yang perlu diperhatikan orangtua',
            style: tsBodyMediumSemibold(blackColor),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            padding: EdgeInsets.symmetric(
                vertical: height * 0.015, horizontal: width * 0.06),
            decoration: BoxDecoration(
                color: warningColor, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      text: 'Lihat Selengkapnya',
                      style: tsLabelLargeRegular(whiteColor)),
                  maxLines: 2,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: whiteColor,
                  size: 12,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
