import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class TugasContainer extends StatelessWidget {
  final String? status;
  final String? point;
  final bool pointContainer;

  const TugasContainer({
    Key? key,
    this.status,
    this.point,
    required this.pointContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: pointContainer == true ? opacity5GreyColor : opacity10BlueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: opacity60BlueColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: AutoSizeText.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    text: 'Dikte & Menulis',
                    style: tsBodySmallSemibold(whiteColor),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          SizedBox(height: 20),
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Menulis 5 benda yang sering dilihat oleh ananda',
              style: tsBodyMediumSemibold(blackColor),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Dibuat pada :',
                      style: tsBodySmallRegular(greyColor),
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconCalender,
                        color: pointContainer == true
                            ? opacity50GreyColor
                            : blueColor,
                      ),
                      SizedBox(width: 5),
                      AutoSizeText.rich(
                        TextSpan(
                          text: 'Senin, 20\nDecember',
                          style: tsBodySmallSemibold(blackColor),
                        ),
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
                          style: tsBodySmallRegular(greyColor),
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SvgPicture.asset(
                            iconCalender,
                            color: pointContainer == true
                                ? opacity50GreyColor
                                : dangerColor,
                          ),
                          SizedBox(width: 5),
                          AutoSizeText.rich(
                            TextSpan(
                              text: 'Rabu, 23\nDecember',
                              style: tsBodySmallSemibold(blackColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 25),
            height: 1,
            width: double.infinity,
            color: opacity20GreyColor,
          ),
          AutoSizeText.rich(
            TextSpan(
              text: 'Deskripsi :\n',
              style: tsBodyMediumSemibold(blackColor),
            ),
          ),
          AutoSizeText.rich(
            TextSpan(
              text:
                  'Berdasarkan gambar tersebut ambil lima barang yang ingin didiktekan, setelah selesai foto hasil tugas anak lalu kumpulkan.',
              style: tsBodySmallMedium(blackColor),
            ),
          ),
          if (pointContainer)
            Container(
              width: width,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: status == 'Selesai' ? successColor : dangerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Total status',
                      style: tsBodySmallRegular(whiteColor),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: greenColor,
                            ),
                          ),
                        ),
                      ),
                      AutoSizeText.rich(
                        TextSpan(
                          text: '${point} Poin',
                          style: tsBodyMediumSemibold(whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
