import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_response.dart';
import 'package:fun_education_app/app/api/shift-masuk/sevice/shift_masuk_sevice.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  ShiftMasukService shiftMasukService = ShiftMasukService();
  ShiftMasukResponse? shiftMasukResponse;
  Rx<Data> shiftMasukModel = Data().obs;
  // late Data shiftMasukModel;

  @override
  void onInit() {
    showCurrentShiftMasuk();
    update();
    super.onInit();

    // shiftMasukModel = Data(
    //   id: "",
    //   userId: "",
    //   shiftMasuk: "",
    // );
  }

  Future showCurrentShiftMasuk() async {
    try {
      final response = await shiftMasukService.getCurrentShiftMasuk();
      shiftMasukResponse = ShiftMasukResponse.fromJson(response.data);
      shiftMasukModel.value = shiftMasukResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }
}
