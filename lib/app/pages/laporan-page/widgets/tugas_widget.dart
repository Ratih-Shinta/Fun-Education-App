import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TugasWidget extends StatelessWidget {
  final dynamic controllerArguments;
  TugasWidget({super.key, this.controllerArguments});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.DETAIL_TUGAS_PAGE,
          arguments: controllerArguments,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: controllerArguments.statusTugasUser == 'Selesai'
                ? greyColor.withOpacity(0.05)
                : controllerArguments.statusTugasUser == 'Gagal'
                    ? greyColor.withOpacity(0.05)
                    : controllerArguments.category == 'Dikte & Menulis'
                        ? blueColor.withOpacity(0.1)
                        : controllerArguments.category == 'Kreasi'
                            ? primaryColor.withOpacity(0.1)
                            : controllerArguments.category == 'Membaca'
                                ? greenColor.withOpacity(0.1)
                                : controllerArguments.category == 'Berhitung'
                                    ? warningColor.withOpacity(0.1)
                                    : dangerColor.withOpacity(0.1),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: controllerArguments.category == 'Dikte & Menulis'
                            ? blueColor.withOpacity(0.6)
                            : controllerArguments.category == 'Kreasi'
                                ? primaryColor.withOpacity(0.6)
                                : controllerArguments.category == 'Membaca'
                                    ? greenColor.withOpacity(0.6)
                                    : controllerArguments.category ==
                                            'Berhitung'
                                        ? warningColor.withOpacity(0.6)
                                        : greyColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: controllerArguments.category,
                          style: tsBodySmallSemibold(whiteColor),
                        ),
                      ),
                    ),
                    if (controllerArguments.statusTugasUser == null)
                      SizedBox(width: 1)
                    else
                      Container(
                        margin: EdgeInsets.only(left: width * 0.015),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: controllerArguments.statusTugasUser ==
                                  'Diperiksa'
                              ? warningColor
                              : controllerArguments.statusTugasUser == 'Selesai'
                                  ? successColor
                                  : dangerColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: AutoSizeText.rich(
                          textAlign: TextAlign.start,
                          TextSpan(
                            text: controllerArguments.statusTugasUser,
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
              TextSpan(
                  text: controllerArguments.title,
                  style: GoogleFonts.poppins(
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: figmaFontsize(14),
                    decoration: controllerArguments.statusTugasUser == 'Selesai'
                        ? TextDecoration.lineThrough
                        : controllerArguments.statusTugasUser == 'Gagal'
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              width: width,
              color: greyColor.withOpacity(0.2),
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
                          color: controllerArguments.statusTugasUser ==
                                  'Selesai'
                              ? greyColor.withOpacity(0.5)
                              : controllerArguments.statusTugasUser == 'Gagal'
                                  ? greyColor.withOpacity(0.5)
                                  : controllerArguments.category ==
                                          'Dikte & Menulis'
                                      ? blueColor
                                      : controllerArguments.category == 'Kreasi'
                                          ? primaryColor
                                          : controllerArguments.category ==
                                                  'Membaca'
                                              ? greenColor
                                              : controllerArguments.category ==
                                                      'Berhitung'
                                                  ? warningColor
                                                  : dangerColor,
                        ),
                        SizedBox(width: 5),
                        AutoSizeText.rich(
                          TextSpan(
                            text:
                                '${DateFormat('EEEE, d\nMMMM yyyy', 'id_ID').format(controllerArguments.createdAt)}',
                            style: tsBodySmallSemibold(blackColor).copyWith(
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                          color: controllerArguments.statusTugasUser ==
                                  'Selesai'
                              ? greyColor.withOpacity(0.5)
                              : controllerArguments.statusTugasUser == 'Gagal'
                                  ? greyColor.withOpacity(0.5)
                                  : dangerColor,
                        ),
                        SizedBox(width: 5),
                        AutoSizeText.rich(
                          TextSpan(
                            text:
                                '${DateFormat('EEEE, d\nMMMM yyyy', 'id_ID').format(controllerArguments.deadline)}',
                            style: tsBodySmallSemibold(blackColor).copyWith(
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
