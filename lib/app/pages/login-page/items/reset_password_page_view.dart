import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class ResetPasswordPageView extends GetView<LoginPageController> {
  const ResetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                        text: 'Reset Password Untuk Akses\n',
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
                    SizedBox(height: height * 0.045),
                    CommonWarning(
                      icon: Icons.info_outline_rounded,
                      backColor: warningColor,
                      text: 'Selalu ingat kata sandinya ya...',
                    ),
                    SizedBox(height: height * 0.03),
                    Column(
                      children: [
                        CommonTextField(
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: greyColor.withOpacity(0.5)),
                          fieldController: controller.passwordController,
                          obscureText: false,
                          hintText: 'Kata Sandi Baru',
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: height * 0.01),
                        CommonTextField(
                          // fieldController: controller.confirmPasswordController,
                          obscureText: true,
                          hintText: 'Konfirmasi Kata Sandi',
                          keyboardType: TextInputType.name,
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: greyColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: height * 0.1,
              //   width: width,
              //   color: primaryColor,
              // )
              CommonButton(
                isLoading: controller.isLoading.value,
                text: 'Reset Password',
                backgroundColor: blackColor,
                textColor: whiteColor,
                onPressed: () {
                  // String? validationMessage = controller.validatePassword();
                  // if (validationMessage != null) {
                  //   Get.snackbar(
                  //     'Password dan Konfimasi Password tidak sama',
                  //     validationMessage,
                  //     backgroundColor: dangerColor,
                  //     colorText: whiteColor,
                  //     snackPosition: SnackPosition.BOTTOM,
                  //   );
                  // } else {
                  // controller.password.value =
                  //     controller.passwordController.text;
                  // controller.sendOTP();
                  // controller.register();
                  //   }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
