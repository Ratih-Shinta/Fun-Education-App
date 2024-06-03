import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:get/get.dart';

class SavingController extends GetxController {
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  var selectedOption = ''.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    update();
    super.onInit();
  }

  Future showCurrentTabungan() async {
    try {
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
