import 'package:fun_education_app/app/api/tugas/models/show-by-id-tugas/show_current_by_id_response.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/service/tugas_service.dart';
import 'package:get/get.dart';

class DetailTugasPageController extends GetxController {
  RxBool isLoading = false.obs;

  TugasService tugasService = TugasService();
  ShowByIdTugasResponse? showByIdTugasResponse;
  Rx<ShowCurrentTugasModel> showByIdTugasModel = ShowCurrentTugasModel().obs;
  RxList<ShowCurrentTugasImageModel> showCurrentTugasImageModel =
      <ShowCurrentTugasImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showByIdTugas(Get.arguments.id);
  }

  Future showByIdTugas(String tugasId) async {
    try {
      isLoading(true);
      final response = await tugasService.getShowByIdTugas(tugasId);
      showByIdTugasResponse = ShowByIdTugasResponse.fromJson(response.data);
      showByIdTugasModel.value = showByIdTugasResponse!.data;
      update();
      print('showbyid ${showByIdTugasModel.value.statusTugasUser}');
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
