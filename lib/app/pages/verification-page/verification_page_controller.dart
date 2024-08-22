import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPageController extends GetxController {
  final LoginPageController loginPageController =
      Get.put(LoginPageController());
  late TextEditingController otpController = TextEditingController();
  late OTPService otpService;

  var otp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    sendOTP();
    otpController = TextEditingController();
    otpService = OTPService();
  }

  Future<void> checkOTP() async {
    try {
      final response = await otpService.storeCheckOTP(
        otpController.text,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

      Get.offAllNamed(Routes.PENDING_PAGE);
      Get.snackbar(
        "Success",
        "OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        'OTP tidak valid',
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      // Get.snackbar("Error", e.toString());
    }
  }

  Future<void> sendOTP() async {
    try {
      final response = await otpService.storeSendOTP(
        loginPageController.emailController.text,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

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
