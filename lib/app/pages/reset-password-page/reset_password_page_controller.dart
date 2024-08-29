import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPasswordPageController extends GetxController {
  RxBool isLoading = true.obs;

  late TextEditingController emailController;
  late TextEditingController otpController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();

  late OTPService otpService;
  late UserService userService;

  var email = ''.obs;
  RxString tokenResetPassword = ''.obs;
  RxBool isOtpSend = false.obs;

  RxString countDown = '00:00'.obs;
  RxInt count = 300.obs;
  Timer? timer;

  @override
  void onInit() {
    emailController = TextEditingController();
    otpController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    otpService = OTPService();
    userService = UserService();
    startTimer();
    super.onInit();
  }

  void resetAndStartTimer() {
    count.value = 300;
    countDown.value = '05:00';
    timer?.cancel();
    startTimer();
  }

  String? validatePassword() {
    if (passwordController.text != confirmPasswordController.text) {
      return 'Password dan konfirmasi password harus sama.';
    }
    return null;
  }

  Future<void> updateResetPassword() async {
    try {
      await userService.putResetPassword(
          email.value, tokenResetPassword.value, passwordController.text);

      isLoading(false);
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

  Future<void> sendOTPResetPassword() async {
    try {
      await otpService.storeSendOTP(
        email.value,
      );
      isLoading(false);
      Get.snackbar(
        "Success",
        "Send OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      isOtpSend.value = true;
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

  Future<void> checkOTP() async {
    try {
      final response =
          await otpService.storeCheckOTP(otpController.text, email.value, true);

      tokenResetPassword.value = response.data['token_reset_password'];
      isLoading(false);
      Get.snackbar(
        "Success",
        "OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.toNamed(Routes.RESET_PASSWORD_PAGE);
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
