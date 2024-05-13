import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/bullet_text.dart';
import 'package:fun_education_app/app/pages/hal-yang-perlu-diperhatikan-page/widgets/button_chip.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HalYangPerluDiperhatikanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(left: width * 0.05, bottom: height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: blackColor,
                ),
              ),
              Expanded(
                child: FunEducation(),
              ),
              SizedBox(width: width * 0.09),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.015,
          ),
          child: Container(
            padding: EdgeInsets.only(
              right: width * 0.05,
              left: width * 0.05,
              top: height * 0.025,
              bottom: height * 0.035,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width * 0.03),
                      width: width * 0.016,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: warningColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                            text: 'Hal - hal yang perlu diperhatikan orangtua',
                            style: tsBodyMediumSemibold(blackColor)),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                ButtonChip(text: 'Libur Siswa'),
                BulletText(text: 'Hari Minggu/Ahad'),
                BulletText(text: 'Tanggal merah /Libur Nasional'),
                ButtonChip(text: 'Seragam'),
                BulletText(boldText: 'WAJIB PAKAI ', text: 'setiap pertemuan'),
                ButtonChip(text: 'Menabung'),
                BulletText(
                    boldTextColor: primaryColor,
                    boldText: 'TIDAK WAJIB',
                    text: ' / bagi yang mau saja'),
                BulletText(
                    text: 'Kegiatan menabung setiap hari Selasa\ndan Kamis'),
                BulletText(text: 'Diluar dari jadwal itu tidak kami terima.'),
                SizedBox(height: height * 0.035),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Flexible(
                      child: AutoSizeText(
                        'Setiap hari Kamis, membawa buku gambar dan pewarna. untuk  melatih motorik halus,motorik kasar, konsentrasi, dan kognitif  anak.',
                        maxLines: 5,
                        style: tsBodySmallSemibold(whiteColor),
                      ),
                    ),
                ),
                SizedBox(height: height * 0.05),
                AutoSizeText.rich(
                  TextSpan(text: 'Dari', style: tsBodySmallRegular(blackColor)),
                ),
                SizedBox(height: height * 0.035),
                AutoSizeText.rich(
                  TextSpan(
                      text: 'Fun Education',
                      style: tsBodySmallSemibold(blackColor)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
