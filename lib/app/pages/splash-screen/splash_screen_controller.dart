import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  @override
  void onInit() {
    super.onInit();
    showCurrentUser();
    Future.delayed(Duration(seconds: 2), () {
      SharedPreferences.getInstance().then((prefs) async {
        await showCurrentUser();
        final token = prefs.getString('token');
        if (token == null ||
            token.isEmpty ||
            showCurrentUserModel.value.isVerifiedEmail == false) {
          Get.offAllNamed(Routes.LOGIN_PAGE);
        } else if (showCurrentUserModel.value.isVerified == false) {
          Get.offAllNamed(Routes.PENDING_PAGE);
        } else {
          Get.offAllNamed(
            Routes.NAVBAR,
            arguments: 0,
          );
        }
      });
    });
  }

  Future showCurrentUser() async {
    try {
      final response = await userService.getShowCurrentUser();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
      update();
      print('showCurrentUserModel : ${showCurrentUserModel.value.nickname}');
    } catch (e) {
      print('showCurrentUserModel $e');
    }
  }
}
