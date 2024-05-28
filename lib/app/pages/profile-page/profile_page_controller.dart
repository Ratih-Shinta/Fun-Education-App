import 'package:fun_education_app/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  RxBool isLoading = false.obs;
  late AuthenticationService authenticationService;

  @override
  void onInit() {
    super.onInit();

    authenticationService = AuthenticationService();
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await authenticationService.logout();

      prefs.remove('token');

      Get.snackbar("Logout Success", "You have been logged out");
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      isLoading.value = true;
      Get.snackbar("Logout Failed", "Network Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
