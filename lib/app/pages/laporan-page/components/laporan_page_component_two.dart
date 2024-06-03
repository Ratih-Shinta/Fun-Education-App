import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/bottomsheet_pilih_bulan.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LaporanPageComponentTwo extends GetView<LaporanPageController> {
  final DetailLaporanBulananController detailLaporanBulananController =
      Get.put(DetailLaporanBulananController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Laporan Bulanan\n',
                style: tsTitleSmallRegular(blackColor).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: 'Ananada',
                    style: tsTitleSmallSemibold(secondaryColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.04,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AutoSizeText(
                DateFormat("MMMM yyyy").format(DateTime.now()).toString(),
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallMedium(blackColor),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        Obx(() {
          if (controller.isLoading.value == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.055,
                vertical: height * 0.025,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.11,
                        height: height * 0.05,
                        padding: EdgeInsets.symmetric(
                          horizontal: height * 0.01,
                          vertical: height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/document.svg',
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Status :',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallRegular(blackColor),
                          ),
                          AutoSizeText(
                            '${controller.showCurrentLaporanBulananModel.value.status}',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodyMediumSemibold(blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: width,
                    height: height * 0.00125,
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Catatan Guru :',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallSemibold(blackColor),
                      ),
                      SizedBox(height: height * 0.01),
                      AutoSizeText(
                        '${controller.showCurrentLaporanBulananModel.value.catatan}',
                        group: AutoSizeGroup(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  ElevatedButton(
                    onPressed: () {
                      detailLaporanBulananController.selectedMonth.value =
                          DateTime.now().month;
                      detailLaporanBulananController
                          .showCurrentDetailLaporanBulanan();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Lihat Selengkapnya',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallSemibold(whiteColor),
                        ),
                        SizedBox(width: width * 0.03),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      minimumSize: Size(
                        width,
                        height * 0.06,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
        SizedBox(height: height * 0.02),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => BottomSheetPilihBulan(),
              isScrollControlled: true,
              backgroundColor: whiteColor,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Pilih Bulan',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(whiteColor),
              ),
              SizedBox(width: width * 0.03),
              Icon(
                Icons.calendar_today_rounded,
                size: 15,
                color: whiteColor,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: blackColor,
            minimumSize: Size(
              width,
              height * 0.06,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
