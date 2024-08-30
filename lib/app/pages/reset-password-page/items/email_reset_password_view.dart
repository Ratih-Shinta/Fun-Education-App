import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/reset-password-page/reset_password_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class EmailResetPasswordView extends GetView<ResetPasswordPageController> {
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
                      text:
                          'Isi Email lalu Verifikasi OTP dulu sebelum reset password ya...',
                    ),
                    SizedBox(height: height * 0.03),
                    CommonTextField(
                      fieldController: controller.emailController,
                      prefixIcon: Icon(Icons.mail_outlined,
                          color: greyColor.withOpacity(0.5)),
                      obscureText: false,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        final emailRegex = RegExp(
                            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingSendOTP.value,
                    text: 'Kirim Email',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.saveEmail();
                      controller.sendOTP();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
