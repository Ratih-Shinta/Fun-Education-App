import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/home-page/components/bottomsheet_catatan_darurat.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageComponentThree extends GetView<HomePageController> {
  const HomePageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(children: [
      Row(children: [
        SvgPicture.asset('assets/icons/icNote.svg'),
        SizedBox(width: 7),
        AutoSizeText.rich(
          TextSpan(text: 'Catatan', style: tsBodyMediumSemibold(blackColor)),
        ),
      ]),
      SizedBox(height: height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.HAL_YANG_PERLU_DIPERHATIKAN_PAGE);
            },
            child: Container(
              width: width * 0.44,
              padding: EdgeInsets.only(
                top: height * 0.025,
                bottom: height * 0.045,
                right: height * 0.02,
                left: height * 0.02,
              ),
              decoration: BoxDecoration(
                color: warningColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    iconDocument,
                    width: 35,
                  ),
                  SizedBox(height: 5),
                  AutoSizeText.rich(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: 'Artikel Baca',
                      style: tsBodySmallRegular(whiteColor),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 15),
                  AutoSizeText.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                        text: 'Hal - hal yang perlu diperhatikan orangtua',
                        style: tsBodyLargeSemibold(whiteColor)),
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetCatatanDarurat();
                    },
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.045,
                  ),
                  decoration: BoxDecoration(
                    color: opacity5GreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text: 'Catatan Darurat',
                            style: tsBodySmallRegular(greyColor)),
                      ),
                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7, horizontal: width * 0.06),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Obx(() {
                            final catatan = controller
                                .showLatestCatatanDaruratModel.value?.catatan;
                            final hasCatatan =
                                catatan != null && catatan.isNotEmpty;
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor:
                                      hasCatatan ? successColor : greyColor,
                                ),
                                SizedBox(width: 5),
                                AutoSizeText.rich(
                                  TextSpan(
                                      text:
                                          '${hasCatatan ? '1 Catatan' : '0 Catatan'}',
                                      style: tsBodySmallSemibold(
                                          hasCatatan ? blackColor : greyColor)),
                                ),
                              ],
                            );
                          })),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_LAPORAN_HARIAN_PAGE);
                },
                child: Obx(() => Container(
                      width: width * 0.44,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: controller.totalPoint.value <= 25
                            ? dangerColor.withOpacity(0.1)
                            : controller.totalPoint.value <= 50
                                ? warningColor.withOpacity(0.1)
                                : controller.totalPoint.value <= 75
                                    ? successColor.withOpacity(0.1)
                                    : successColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    iconDocument,
                                    width: 35,
                                    color: controller.totalPoint.value <= 25
                                        ? dangerColor
                                        : controller.totalPoint.value <= 50
                                            ? warningColor
                                            : controller.totalPoint.value <= 75
                                                ? successColor
                                                : successColor,
                                  ),
                                  SizedBox(width: 8.0),
                                  AutoSizeText.rich(
                                    TextSpan(
                                      text: 'Laporan \n',
                                      style: tsBodySmallRegular(blackColor)
                                          .copyWith(
                                        height: 1.3,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Harian',
                                          style: tsBodySmallRegular(blackColor),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          AutoSizeText.rich(
                            TextSpan(
                                text: controller.totalPoint.value <= 25
                                    ? 'Kurang'
                                    : controller.totalPoint.value <= 50
                                        ? 'Cukup'
                                        : controller.totalPoint.value <= 75
                                            ? 'Baik'
                                            : 'Sangat Baik',
                                style: tsBodyMediumSemibold(blackColor)),
                          ),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  size: 14, color: greyColor),
                              SizedBox(width: 5),
                              AutoSizeText.rich(
                                TextSpan(
                                    text: 'Today',
                                    style: tsBodySmallRegular(greyColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    ]);
  }
}
