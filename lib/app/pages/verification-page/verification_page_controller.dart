import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationPageController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
  late TextEditingController otpController = TextEditingController();
  late OTPService otpService;

  RxString countDown = '00:00'.obs;
  RxInt count = 300.obs;
  Timer? timer;

  var otp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    otpService = OTPService();
    startTimer();
  }

  void resetAndStartTimer() {
    count.value = 300;
    countDown.value = '05:00';
    timer?.cancel();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer t) {
      if (count.value == 0) {
        t.cancel();
        countDown.value = 'time out'; // Set the "time out" message
      } else {
        count.value--;
        int minute = count.value ~/ 60;
        int second = count.value % 60;
        countDown.value =
            '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
      }
    });
  }

  Future<void> checkOTP() async {
    try {
      await otpService.storeCheckOTP(otpController.text,
          homePageController.showCurrentUserModel.value.email!, false);

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
        e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendOTP() async {
    try {
      await otpService.storeSendOTP(
        homePageController.showCurrentUserModel.value.email!,
      );

      Get.snackbar(
        "Success",
        "Send OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      resetAndStartTimer();
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

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
