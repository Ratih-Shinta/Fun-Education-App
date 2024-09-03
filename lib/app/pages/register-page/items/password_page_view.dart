import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/global-component/fun_education.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(left: width * 0.05, bottom: height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: blackColor,
                ),
              ),
              Expanded(
                child: FunEducation(
                  width: 25,
                  textStyle: tsBodyLargeSemibold(primaryColor),
                ),
              ),
              SizedBox(width: width * 0.09),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.05,
            ),
            child: Column(
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
                SizedBox(height: height * 0.06),
                CommonWarning(
                  icon: Icons.info_outline_rounded,
                  backColor: warningColor,
                  text:
                      'Lupa kata sandi atau ingin mengubahnya? Silahkan hubungi guru.',
                ),
                SizedBox(height: height * 0.03),
                Obx(
                  () {
                    return Column(
                      children: [
                        CommonTextField(
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: greyColor.withOpacity(0.5)),
                          fieldController: controller.passwordController,
                          obscureText: controller.isVisibleSignIn.value,
                          hintText: 'Kata Sandi',
                          keyboardType: TextInputType.name,
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
                          validator: (value) {
                            if (value!.length < 5) {
                              return 'Password minimal 5 karakter';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height * 0.01),
                        CommonTextField(
                          fieldController: controller.confirmPasswordController,
                          obscureText: controller.isVisibleSignInConfirm.value,
                          hintText: 'Konfirmasi Kata Sandi',
                          keyboardType: TextInputType.name,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.isVisibleSignInConfirm.value =
                                  !controller.isVisibleSignInConfirm.value;
                            },
                            icon: Icon(
                              controller.isVisibleSignInConfirm.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color: greyColor,
                            ),
                          ),
                          validator: (value) {
                            if (value!.length < 5) {
                              return 'Password minimal 5 karakter';
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: greyColor.withOpacity(0.5)),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: height * 0.08),
                Obx(
                  () => CommonButton(
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CommonAlertDialog(
                              title: 'Konfirmasi',
                              content:
                                  'Apakah anda sudah yakin dengan semua data yang anda input?',
                              cancelButtonText: 'Belum',
                              confirmButtonText: 'Yakin',
                              onConfirm: () {
                                controller.password.value =
                                    controller.passwordController.text;
                                controller.register();
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
