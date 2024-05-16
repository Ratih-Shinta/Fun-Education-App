import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  late TextEditingController namaLengkapController;
  late TextEditingController passwordController;

  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    namaLengkapController = TextEditingController();
    passwordController = TextEditingController();

    authenticationService = AuthenticationService();
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          namaLengkapController.text,
          passwordController.text
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.HOME_PAGE);



    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid Username or Password");
      print(e);

    } finally {
      isLoading(false);
    }
  }

}
