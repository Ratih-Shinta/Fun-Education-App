import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanContainer extends GetView<LaporanPageController> {
  final String poin;
  final String catatan;
  const LaporanContainer(this.poin, this.catatan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: poin == '25'
            ? dangerColor.withOpacity(0.1)
            : poin == '50'
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
                    color: poin == '25'
                        ? dangerColor
                        : poin == '50'
                            ? warningColor
                            : greenColor,
                    height: 40,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Laporan Harian\n',
                      style: tsBodyMediumSemibold(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text:
                              '${DateFormat('EEEE, dd MMMM yyyy').format(controller.selectedDate.value)}',
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
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: opacity50WhiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(TextSpan(
                  text: 'Total Point :',
                  style: tsBodySmallRegular(blackColor),
                )),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 5, bottom: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: poin == '25'
                            ? dangerColor
                            : poin == '50'
                                ? warningColor
                                : successColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: IconPoint(
                        point: poin,
                        color: poin == '25'
                            ? dangerColor
                            : poin == '50'
                                ? warningColor
                                : successColor,
                        textStyle: tsBodySmallSemibold(whiteColor),
                      ),
                    ),
                    AutoSizeText.rich(TextSpan(
                      text: poin == '25'
                          ? 'Kurang'
                          : poin == '50'
                              ? 'Cukup'
                              : poin == '75'
                                  ? 'Baik'
                                  : 'Sangat Baik',
                      style: tsBodySmallSemibold(blackColor),
                    )),
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
                            backgroundColor: catatan == '0'
                                ? opacity50GreyColor
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
