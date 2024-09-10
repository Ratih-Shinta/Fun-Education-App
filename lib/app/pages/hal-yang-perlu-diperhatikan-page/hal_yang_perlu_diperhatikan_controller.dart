import 'package:fun_education_app/app/api/school-information/models/school_information_description_model.dart';
import 'package:fun_education_app/app/api/school-information/models/show_school_information_model.dart';
import 'package:fun_education_app/app/api/school-information/models/show_school_information_respose.dart';
import 'package:fun_education_app/app/api/school-information/school_infomation_service.dart';
import 'package:get/get.dart';

class HalYangPerluDiperhatikanController extends GetxController {
  RxBool isLoading = false.obs;
  SchoolInfomationService schoolInfomationService = SchoolInfomationService();
  ShowSchoolInfomationResponse? showSchoolInfomationResponse;
  RxList<ShowSchoolInfomationModel> showSchoolInformationModel =
      <ShowSchoolInfomationModel>[].obs;
  RxList<SchoolInfomationDescriptionModel> schoolInfomationDescriptionModel =
      <SchoolInfomationDescriptionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showSchoolInformation();
  }

  Future showSchoolInformation() async {
    try {
      isLoading(true);
      final response = await schoolInfomationService.getShowSchoolInformation();
      showSchoolInfomationResponse =
          ShowSchoolInfomationResponse.fromJson(response.data);
      showSchoolInformationModel.value = showSchoolInfomationResponse!.data;
      isLoading(false);
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }
}
