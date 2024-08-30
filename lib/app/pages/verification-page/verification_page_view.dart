import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/verification-page/verification_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerificationPageView extends GetView<VerificationPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.only(right: width * 0.03),
      width: width * 0.16,
      height: height * 0.08,
      textStyle: tsBodyLargeMedium(blackColor),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Kode Verifikasi Email',
                    style: tsTitleMediumSemibold(blackColor),
                    children: [
                      TextSpan(
                        text: '\nKode akan dikirimkan melalui inbox email',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
                Center(
                  child: Pinput(
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    showCursor: true,
                    textInputAction: TextInputAction.next,
                    controller: controller.otpController,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: primaryColor.withOpacity(0.1),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: primaryColor.withOpacity(0.05),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Kode akan hangus dalam ',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodyMediumRegular(blackColor),
                    ),
                    SizedBox(
                      width: width * 0.005,
                    ),
                    InkWell(
                        child: Obx(
                      () => AutoSizeText(
                        controller.countDown.value,
                        style: tsBodyMediumSemibold(primaryColor),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: height * 0.05),
                Obx(() => CommonButton(
                      isLoading: controller.isLoading.value,
                      text: 'Verifikasi',
                      backgroundColor: blackColor,
                      textColor: whiteColor,
                      onPressed: () {
                        controller.checkOTP();
                      },
                    )),
                SizedBox(height: height * 0.015),
                Obx(() => CommonButton(
                      isLoading: controller.idloadingSendOTP.value,
                      text: 'Kirim Ulang Kode',
                      backgroundColor: greyColor.withOpacity(0.1),
                      textColor: blackColor,
                      onPressed: () {
                        controller.sendOTP();
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
