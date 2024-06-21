import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class DetailTugasDiperiksa extends StatelessWidget {
  const DetailTugasDiperiksa({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: blueColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: blueColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: AutoSizeText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                          text: 'Dikte & Menulis',
                          style: tsBodySmallSemibold(whiteColor)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: warningColor,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: AutoSizeText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                          text: 'Diperiksa',
                          style: tsBodySmallSemibold(whiteColor)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                    text: 'Menulis 5 benda yang sering dilihat oleh ananda',
                    style: tsBodyMediumSemibold(blackColor)),
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
                            style: tsBodySmallRegular(greyColor)),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SvgPicture.asset(
                            iconCalender,
                            color: blueColor,
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
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 25),
                height: 1,
                width: double.infinity,
                color: opacity20GreyColor,
              ),
              AutoSizeText.rich(
                TextSpan(
                    text: 'Deskripsi :\n',
                    style: tsBodyMediumSemibold(blackColor)),
              ),
              AutoSizeText.rich(
                TextSpan(
                    text:
                        'Berdasarkan gambar tersebut ambil lima barang yang ingin didiktekan, setelah selesai foto hasil tugas anak lalu kumpulkan.',
                    style: tsBodySmallMedium(blackColor)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            SvgPicture.asset('assets/icons/icTaskList.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(text: 'Tugas', style: tsBodyMediumSemibold(blackColor)),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: height * 0.092,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 16),
                child: Container(
                  width: width * 0.27,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ),
        AutoSizeText.rich(
          TextSpan(
            text: 'Catatan Orang Tua\n',
            style: tsBodyMediumSemibold(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: '*opsional',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
          width: width,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: opacity5GreyColor),
          child: AutoSizeText.rich(
            TextSpan(
              text: 'Sudah lumayan lancar kok bu...',
              style: tsBodySmallSemibold(blackColor),
            ),
          ),
        )
      ],
    );
  }
}
