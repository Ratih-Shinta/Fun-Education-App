import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class TugasWidget extends StatelessWidget {
  final String category;
  final String title;
  final String status;
  const TugasWidget(
      {super.key,
      required this.category,
      required this.title,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: category == 'Dikte & Menulis'
              ? blueColor.withOpacity(0.1)
              : category == 'Kreasi'
                  ? primaryColor.withOpacity(0.1)
                  : category == 'Membaca'
                      ? greenColor.withOpacity(0.1)
                      : category == 'Berhitung'
                          ? warningColor.withOpacity(0.1)
                          : opacity20GreyColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: category == 'Dikte & Menulis'
                          ? blueColor.withOpacity(0.6)
                          : category == 'Kreasi'
                              ? primaryColor.withOpacity(0.6)
                              : category == 'Membaca'
                                  ? greenColor.withOpacity(0.6)
                                  : category == 'Berhitung'
                                      ? warningColor.withOpacity(0.6)
                                      : opacity20GreyColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: AutoSizeText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: category,
                        style: tsBodySmallSemibold(whiteColor),
                      ),
                    ),
                  ),
                  if (status == 'null')
                    SizedBox(width: 1)
                  else
                    Container(
                      margin: EdgeInsets.only(left: width * 0.015),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: status == 'Diperiksa'
                            ? warningColor
                            : status == 'Selesai'
                                ? successColor
                                : dangerColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: status,
                          style: tsBodySmallSemibold(whiteColor),
                        ),
                      ),
                    ),
                ],
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
            width: width,
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
                        color: category == 'Dikte & Menulis'
                            ? blueColor
                            : category == 'Kreasi'
                                ? primaryColor
                                : category == 'Membaca'
                                    ? greenColor
                                    : category == 'Berhitung'
                                        ? warningColor
                                        : opacity20GreyColor,
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
