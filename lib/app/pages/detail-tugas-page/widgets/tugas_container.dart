import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TugasContainer extends StatelessWidget {
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  final argument = Get.arguments;

  final String? status;
  final bool pointContainer;

  TugasContainer({
    Key? key,
    this.status,
    required this.pointContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

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
                    text: '${argument.category}',
                    style: tsBodySmallSemibold(whiteColor),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // if (pointContainer)
              Obx(() {
                if (laporanPageController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (argument.statusTugasUser == null) {
                  return SizedBox(width: 1);
                } else {
                  return Container(
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
                  );
                }
              })
            ],
          ),
          SizedBox(height: 20),
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: '${argument.title}',
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
                          text:
                              '${DateFormat('EEEE, d\nMMMM', 'id_ID').format(argument.createdAt)}',
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
                              text:
                                  '${DateFormat('EEEE, d\nMMMM', 'id_ID').format(argument.deadline)}',
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
              text: '${argument.description}',
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
                      text: 'Ananda Mendapatkan Poin',
                      style: tsBodySmallRegular(whiteColor),
                    ),
                  ),
                  IconPoint(
                      point: '${argument.point.toString()}',
                      color: status == 'Selesai' ? successColor : dangerColor),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
