import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/pending-page/pending_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PendingPageView extends GetView<PendingPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SmartRefresher(
          onRefresh: () {
            controller.showCurrentUser();
            controller.refreshController.refreshCompleted();
          },
          controller: controller.refreshController,
          header: WaterDropHeader(
            complete: Text(
              'Refresh Completed',
              style: tsBodySmallRegular(blackColor),
            ),
            waterDropColor: primaryColor,
          ),
          child: Container(
            height: height * 0.95,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icLogo.svg',
                      width: width * 0.08,
                    ),
                    SizedBox(width: width * 0.01),
                    AutoSizeText(
                      'Fun Education',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodyLargeSemibold(primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.06),
                Column(
                  children: [
                    SvgPicture.asset('assets/images/imgPending.svg'),
                    SizedBox(height: height * 0.03),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Tunggu Konformasi Dari Guru\n',
                        style: tsBodyLargeRegular(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Untuk Melanjutkan',
                            style: tsBodyLargeRegular(blackColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.06),
                Obx(
                  () {
                    if (controller.showCurrentUserModel.value.isVerified ==
                        true) {
                      return CommonButton(
                        isLoading: controller.isLoading.value,
                        text: 'Masuk',
                        backgroundColor: blackColor,
                        textColor: whiteColor,
                        onPressed: () {
                          Get.offAllNamed(Routes.NAVBAR);
                        },
                      );
                    } else {
                      return CommonButton(
                        text: 'Masuk',
                        backgroundColor: silverColor.withOpacity(0.2),
                        textColor: whiteColor,
                        onPressed: () {
                          Get.snackbar(
                              'Not verified', 'Belum di verifikasi oleh guru');
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
