import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_model.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/model/current_pengajuan_tabungan_response.dart';
import 'package:fun_education_app/app/api/pengajuan-tabungan/service/pengajuan_tabungan_service.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_model.dart';
import 'package:fun_education_app/app/api/tabungan/models/show_current_tabungan_response.dart';
import 'package:fun_education_app/app/api/tabungan/service/tabungan_service.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SavingPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  TabunganService tabunganService = TabunganService();
  ShowCurrentTabunganResponse? showCurrentTabunganResponse;
  Rx<ShowCurrentTabunganModel> showCurrentTabunganModel =
      ShowCurrentTabunganModel().obs;


  RxBool isLoading = true.obs;
  RxBool isVisibleSignIn = true.obs;

  var selectedOption = ''.obs;
  final minimumPengajuanTabungan = 100000.obs;
  var status = 'null'.obs;
  var isEnough = false.obs;

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
      print('saving amount : ${showCurrentTabunganModel.value.savingInt}');
    } catch (e) {
      print(e);
    }
  }
}
