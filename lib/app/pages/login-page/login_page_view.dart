import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
import 'package:fun_education_app/app/global-component/loading_overlay.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/app/pages/login-page/widgets/login_form_widget.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: width * 0.5,
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.06),
          child: FunEducation(
              width: 26, textStyle: tsBodyLargeSemibold(primaryColor)),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => LoadingOverlay(
              isLoading: controller.isLoading.value,
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: height * 0.03,
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.05),
                    SvgPicture.asset(
                      'assets/images/login.svg',
                      width: width * 0.65,
                    ),
                    SizedBox(height: height * 0.03),
                    AutoSizeText.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Selamat datang di\n',
                        style: tsTitleMediumRegular(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'FunEduation',
                            style: tsTitleMediumSemibold(secondaryColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: height * 0.05),
                    CommonWarning(
                        backColor: warningColor,
                        icon: Icons.info_outline,
                        text:
                            'Isi dengan kata sandi yang telah diberikan oleh guru'),
                    SizedBox(height: height * 0.03),
                    LoginFormWidget(
                      obscureText: false,
                      hintText: "Nama Lengkap",
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                        color: greyColor,
                      ),
                      fieldController: controller.usernameController,
                    ),
                    SizedBox(height: height * 0.015),
                    LoginFormWidget(
                      fieldController: controller.passwordController,
                      obscureText: controller.isVisibleSignIn.value,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                        color: greyColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isVisibleSignIn.value =
                              !controller.isVisibleSignIn.value;
                        },
                        icon: Icon(
                          controller.isVisibleSignIn.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: greyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    CommonButton(
                      text: 'Masuk',
                      onPressed: () {
                        controller.login();
                      },
                      color: blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
