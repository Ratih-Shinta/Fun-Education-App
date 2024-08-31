import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/register-page/components/register_component_one.dart';
import 'package:fun_education_app/app/pages/register-page/components/register_component_two.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.05,
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
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: 'Daftarkan Data Anak di\n',
                    style: tsTitleSmallRegular(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Fun Education',
                        style: tsTitleSmallSemibold(blackColor),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: height * 0.03),
                RegisterComponentOne(),
                SizedBox(height: height * 0.03),
                RegisterComponentTwo(),
                SizedBox(height: height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Sudah punya akun? ',
                        style: tsBodySmallRegular(blackColor)),
                    InkWell(
                      child: AutoSizeText('Masuk',
                          style: tsBodySmallSemibold(primaryColor)),
                      onTap: () => Get.toNamed(Routes.LOGIN_PAGE),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CommonButton(
                  isLoading: controller.isLoading.value,
                  text: 'Lanjut',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.checkEmail();
                    controller.saveRegisterValue();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
