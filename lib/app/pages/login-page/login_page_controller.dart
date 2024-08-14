import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  late TextEditingController nicknameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isVisibleSignIn = true.obs;

  late AuthenticationService authenticationService;

  @override
  void onInit() {
    nicknameController.text = 'Syahran';
    passwordController.text = 'rafapass';

    authenticationService = AuthenticationService();
    super.onInit();
  }  

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          nicknameController.text, passwordController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar(
        "Login Success",
        "Welcome Back!",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.NAVBAR);
    } catch (e) {
      isLoading(true);
      Get.snackbar(
        "Login Error",
        "Invalid Username or Password",
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
