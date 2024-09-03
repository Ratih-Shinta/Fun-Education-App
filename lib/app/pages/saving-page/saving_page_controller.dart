import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavingPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    showCurrentTabungan();
    update();
    super.onInit();
  }

  Future showCurrentTabungan() async {
    try {
      isLoading(true);
      final response = await tabunganService.getShowCurrentTabungan();
      showCurrentTabunganResponse =
          ShowCurrentTabunganResponse.fromJson(response.data);
      showCurrentTabunganModel.value = showCurrentTabunganResponse!.data;
      isLoading(false);
      update();
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }
}
