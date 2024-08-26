import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isVisibleSignIn = true.obs;

  late AuthenticationService authenticationService;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          emailController.text, passwordController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

      await homePageController.showCurrentUser();
      if (homePageController.showCurrentUserModel.value.isVerifiedEmail ==
          false) {
        Get.offNamed(Routes.VERIFICATION_PAGE);
      } else if (homePageController.showCurrentUserModel.value.isVerified ==
          false) {
        Get.offNamed(Routes.PENDING_PAGE);
      } else {
        Get.offNamed(Routes.NAVBAR);
      }

      Get.snackbar(
        "Login Success",
        "Welcome Back!",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      // Get.offNamed(Routes.NAVBAR);
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
