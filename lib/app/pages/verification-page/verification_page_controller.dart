import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPageController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
  // final LoginPageController loginPageController =
  //     Get.put(LoginPageController());
  // final RegisterPageController registerPageController = Get.put(RegisterPageController());
  late TextEditingController otpController = TextEditingController();
  late OTPService otpService;

  RxString countDown = '00:00'.obs;
  var otp = ''.obs;
  RxInt count = 300.obs;

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    otpService = OTPService();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (count.value == 0) {
        timer.cancel();
      } else {
        count.value--;
        int minute = int.parse(countDown.value.split(':')[0]);
        int second = int.parse(countDown.value.split(':')[1]);
        minute = count.value ~/ 60;
        second = count.value % 60;

        if (second < 10) {
          countDown.value = '0$minute:0$second';
        } else {
          countDown.value = '0$minute:$second';
        }
      }
    });
  }

  Future<void> checkOTP() async {
    try {
      final response = await otpService.storeCheckOTP(
        otpController.text,
      );

      Get.snackbar(
        "Success",
        "OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.PENDING_PAGE);
    } catch (e) {
      Get.snackbar(
        "Error",
        'OTP tidak valid',
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendOTP() async {
    try {
      final response = await otpService.storeSendOTP(
        homePageController.showCurrentUserModel.value.email!,
      );

      Get.snackbar(
        "Success",
        "Send OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
