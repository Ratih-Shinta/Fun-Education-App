import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class PasswordPageView extends GetView<RegisterPageController> {
  const PasswordPageView({super.key});

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
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                    SvgPicture.asset('assets/images/imgPassword.svg'),
                    SizedBox(height: height * 0.03),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Selamat Datang di\n',
                        style: tsTitleMediumRegular(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Fun Education',
                            style: tsTitleMediumSemibold(blackColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.06),
                CommonWarning(
                  icon: Icons.info_outline_rounded,
                  backColor: warningColor,
                  text:
                      'Perubahan kata sandi hanya bisa oleh guru, kontak guru apabila lupa',
                ),
                SizedBox(height: height * 0.03),
                Column(
                  children: [
                    CommonTextField(
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.passwordController,
                      obscureText: false,
                      hintText: 'Kata Sandi',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    CommonTextField(
                      fieldController: controller.confirmPasswordController,
                      obscureText: true,
                      hintText: 'Konfirmasi Kata Sandi',
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: greyColor.withOpacity(0.5)),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.08),
                CommonButton(
                  isLoading: controller.isLoading.value,
                  text: 'Daftar',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    String? validationMessage = controller.validatePassword();
                    if (validationMessage != null) {
                      Get.snackbar(
                        'Password dan Konfimasi Password tidak sama',
                        validationMessage,
                        backgroundColor: dangerColor,
                        colorText: whiteColor,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      controller.password.value =
                          controller.passwordController.text;
                      controller.sendOTP();
                      controller.register();
                    }
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
