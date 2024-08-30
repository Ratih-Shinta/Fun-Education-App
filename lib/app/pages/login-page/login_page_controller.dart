import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isVisibleSignIn = true.obs;

  late AuthenticationService authenticationService;

    UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;


  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();
    super.onInit();
  }

  Future showCurrentUser() async {
    try {
      final response = await userService.getShowCurrentUser();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
      isLoading.value = false;
      update();
      print('showCurrentUserModel : ${showCurrentUserModel.value.nickname}');
    } catch (e) {
      print('showCurrentUserModel $e');
    }
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          emailController.text, passwordController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.data['token']);

      await showCurrentUser();
      if (showCurrentUserModel.value.isVerifiedEmail ==
          false) {
        Get.offNamed(Routes.VERIFICATION_PAGE);
      } else if (showCurrentUserModel.value.isVerified ==
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
      isLoading(false);
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
