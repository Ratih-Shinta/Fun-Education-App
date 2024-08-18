import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LaporanContainer extends StatelessWidget {
  final String date;
  final int poin;
  final String catatan;
  const LaporanContainer(this.poin, this.catatan,
      {super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: poin <= 25
            ? dangerColor.withOpacity(0.1)
            : poin <= 50
                ? warningColor.withOpacity(0.1)
                : successColor.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    iconDocument,
                    color: poin <= 25
                        ? dangerColor
                        : poin <= 50
                            ? warningColor
                            : greenColor,
                    height: 40,
                  ),
                  SizedBox(width: 8),
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Laporan Harian\n',
                      style: tsBodyMediumSemibold(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: '$date',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: blackColor,
                size: 15,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: whiteColor.withOpacity(0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(TextSpan(
                  text: 'Total Point :',
                  style: tsBodySmallRegular(blackColor),
                )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 5, bottom: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: poin <= 25
                            ? dangerColor
                            : poin <= 50
                                ? warningColor
                                : successColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: IconPoint(
                        point: poin.toString(),
                        color: poin <= 25
                            ? dangerColor
                            : poin <= 50
                                ? warningColor
                                : successColor,
                        textStyle: tsBodySmallSemibold(whiteColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: AutoSizeText.rich(TextSpan(
                        text: poin <= 25
                            ? 'Kurang'
                            : poin <= 50
                                ? 'Cukup'
                                : poin <= 75
                                    ? 'Baik'
                                    : 'Sangat Baik',
                        style: tsBodySmallSemibold(blackColor),
                      )),
                    ),
                  ],
                ),
                AutoSizeText.rich(TextSpan(
                  text: 'Catatan Guru :',
                  style: tsBodySmallRegular(blackColor),
                )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: whiteColor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: catatan.isEmpty
                                ? greyColor.withOpacity(0.5)
                                : poin <= 25
                                    ? dangerColor
                                    : poin <= 50
                                        ? warningColor
                                        : successColor,
                          ),
                          SizedBox(width: 5),
                          AutoSizeText.rich(TextSpan(
                            text: '${catatan} Catatan',
                            style: tsBodySmallSemibold(blackColor),
                          )),
                        ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
