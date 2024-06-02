import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_controller.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_catatan_darurat.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageComponentTwo extends StatelessWidget {
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  final DetailLaporanBulananController detailLaporanBulananController =
      Get.put(DetailLaporanBulananController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.43,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 4.5, bottom: 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.access_time_filled,
                  color: whiteColor,
                  size: 18,
                ),
              ),
              AutoSizeText.rich(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                    text: 'Catatan Darurat',
                    style: tsBodySmallRegular(blackColor)),
                maxLines: 2,
              ),
              SizedBox(height: 15),
              AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                    text: 'Tidak Ada\nCatatan',
                    style: tsBodyMediumSemibold(blackColor)),
                maxLines: 2,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomsheetCatatanDarurat());
                },
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.075),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.014, horizontal: width * 0.05),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: 'Lihat Detail',
                            style: tsLabelLargeRegular(whiteColor)),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: whiteColor,
                        size: 12,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width * 0.43,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                margin: EdgeInsets.only(right: 4.5, bottom: 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      iconDocument,
                      color: blackColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      DateFormat("MMMM yyyy").format(DateTime.now()).toString(),
                      style: tsBodySmallRegular(blackColor),
                    )
                  ],
                ),
              ),
              Container(
                child: AutoSizeText.rich(
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                      text: 'Catatan Bulanan',
                      style: tsBodySmallRegular(whiteColor)),
                ),
              ),
              SizedBox(height: 15),
              AutoSizeText.rich(
                textAlign: TextAlign.start,
                group: AutoSizeGroup(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                TextSpan(
                    text: laporanPageController
                                .showCurrentLaporanBulananModel.value.catatan ==
                            null
                        ? 'Tidak Ada\nCatatan'
                        : laporanPageController
                            .showCurrentLaporanBulananModel.value.catatan,
                    style: tsBodyMediumSemibold(whiteColor)),
              ),
              InkWell(
                onTap: () {
                  detailLaporanBulananController.selectedMonth.value =
                      DateTime.now().month;
                  detailLaporanBulananController
                      .showCurrentDetailLaporanBulanan();
                },
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.075),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.014, horizontal: width * 0.05),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            text: 'Lihat Detail',
                            style: tsLabelLargeRegular(blackColor)),
                        maxLines: 2,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: blackColor,
                        size: 12,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
