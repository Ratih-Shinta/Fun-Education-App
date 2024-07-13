import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class DetailComponentFive extends StatelessWidget {
  const DetailComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            TextSpan(
              text: 'Merasa Kurang Paham?',
              style: tsBodyMediumBold(whiteColor),
            ),
          ),
          SizedBox(height: 5),
          AutoSizeText.rich(
            TextSpan(
              text: 'Konsultasikan dengan guru',
              style: tsBodySmallRegular(whiteColor),
            ),
          ),
          SizedBox(height: 24),
          InkWell(
            onTap: () {
              // Button action
            },
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconChat,
                    color: blackColor,
                  ),
                  SizedBox(width: 5),
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Konsultasi',
                      style: tsBodySmallSemibold(blackColor),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
