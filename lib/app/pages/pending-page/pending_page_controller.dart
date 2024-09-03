import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PendingPageController extends GetxController {
  RxBool isLoading = false.obs;
    RefreshController refreshController = RefreshController();
    
  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

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

}