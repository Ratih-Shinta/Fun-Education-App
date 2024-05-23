import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_response.dart';
import 'package:fun_education_app/app/api/shift-masuk/service/shift_masuk_sevice.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app/app/api/users/service/user_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomePageController extends GetxController {
  ShiftMasukService shiftMasukService = ShiftMasukService();
  ShiftMasukResponse? shiftMasukResponse;
  Rx<ShiftMasukModel> shiftMasukModel = ShiftMasukModel().obs;

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  RxBool isLoading = true.obs;
  
  @override
  void onInit() {
    showCurrentShiftMasuk();
    showCurrentUser();
    update();
    super.onInit();
  }

  Future showCurrentShiftMasuk() async {
    try {
      final response = await shiftMasukService.getCurrentShiftMasuk();
      shiftMasukResponse = ShiftMasukResponse.fromJson(response.data);
      shiftMasukModel.value = shiftMasukResponse!.data;
      // print(shiftMasukModel.value);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showCurrentUser() async {
    try {
      final response = await userService.getShowCurrentUser();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
      print( showCurrentUserModel.value.profilePicture);
      isLoading.value = false;

      update();
    } catch (e) {
      print(e);
    }
  }
}
