import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageComponentThree extends GetView<LaporanPageController> {
  final DetailLaporanHarianController detailLaporanHarianController =
      Get.put(DetailLaporanHarianController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        Row(
            children: [
              SvgPicture.asset('assets/icons/icTaskList.svg'),
              SizedBox(width: width * 0.02),
              AutoSizeText.rich(
                TextSpan(
                    text: 'Alur Belajar Ananda',
                    style: tsBodyMediumSemibold(blackColor)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 30),
            padding: EdgeInsets.only(right: 21, left: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text: 'Mengenalkan Buku A',
                            style: tsBodyMediumSemibold(whiteColor)),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText.rich(TextSpan(
                            text: "•",
                            style: tsBodySmallRegular(whiteColor),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: 'Menebalkan Huruf',
                                style: tsBodySmallRegular(whiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText.rich(TextSpan(
                            text: "•",
                            style: tsBodySmallRegular(whiteColor),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: AutoSizeText.rich(
                              TextSpan(
                                text: 'Membaca Kartu Baju Sampai Cabe',
                                style: tsBodySmallRegular(whiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
