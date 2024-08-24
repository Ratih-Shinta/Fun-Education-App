import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginPageView extends GetView<LoginPageController> {
  LoginPageView({super.key});

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
                    SvgPicture.asset('assets/images/imgLogin.svg'),
                    SizedBox(height: height * 0.03),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Buat Password Untuk Akses\n',
                        style: tsTitleMediumRegular(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'FunEducation App',
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
                  text: 'Isi dengan kata sandi yang telah diberikan oleh guru',
                ),
                SizedBox(height: height * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonTextField(
                      prefixIcon: Icon(Icons.person_2_outlined,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.emailController,
                      obscureText: false,
                      hintText: 'Email',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    CommonTextField(
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.passwordController,
                      obscureText: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: greyColor.withOpacity(0.5),
                        ),
                        onPressed: () {},
                      ),
                      hintText: 'Kata Sandi',
                      keyboardType: TextInputType.name,
                    ),
                    InkWell(
                      child: AutoSizeText('Lupa Kata Sandi?',
                          style: tsLabelLargeMedium(dangerColor)),
                      // onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD_PAGE),
                    )
                  ],
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Belum punya akun? ',
                        style: tsBodySmallRegular(blackColor)),
                    InkWell(
                      child: AutoSizeText('Daftar',
                          style: tsBodySmallSemibold(primaryColor)),
                      onTap: () => Get.toNamed(Routes.REGISTER_PAGE),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CommonButton(
                  isLoading: controller.isLoading.value,
                  text: 'Masuk',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.login();
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
