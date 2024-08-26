import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ResetPasswordPageController extends GetxController {
  RxBool isLoading = false.obs;

  late TextEditingController emailController;
  late TextEditingController otpController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late OTPService otpService;
  late UserService userService;

  var email = ''.obs;
  RxString tokenResetPassword = ''.obs;

  RxString countDown = '00:00'.obs;
  RxInt count = 300.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    otpController = TextEditingController();
    passwordController = TextEditingController();
    otpService = OTPService();
    userService = UserService();
    startTimer();
    super.onInit();
  }

  Future<void> updateResetPassword() async {
    try {
      await userService.putResetPassword(
          'akbarfelda65@gmail.com', tokenResetPassword.value, passwordController.text);

          print('email: ${email.value}');
          print('tokenResetPassword: ${tokenResetPassword.value}');
          print('password: ${passwordController.text}');

      Get.snackbar(
        "Success",
        "Reset password successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.LOGIN_PAGE);
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

  void saveEmail() {
    email.value = emailController.text;
    Get.toNamed(Routes.VERIFICATION_RESET_PASSWORD_PAGE);
    sendOTPResetPassword();
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

  Future<void> sendOTPResetPassword() async {
    try {
      await otpService.storeSendOTP(
        email.value,
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

  Future<void> checkOTP() async {
    try {
      final response =
          await otpService.storeCheckOTP(otpController.text, email.value, true);

      tokenResetPassword.value = response.data['token_reset_password'];

      Get.snackbar(
        "Success",
        "OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.RESET_PASSWORD_PAGE);
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
