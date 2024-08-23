import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/OTP/service/otp_service.dart';
import 'package:fun_education_app/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPageController extends GetxController {
  // final LoginPageController loginPageController =
  //     Get.put(LoginPageController());
  final RegisterPageController registerPageController = Get.put(RegisterPageController());
  late TextEditingController otpController = TextEditingController();
  late OTPService otpService;

  var otp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    otpService = OTPService();
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


}
