import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_model.dart';
import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_response.dart';
import 'package:fun_education_app/app/api/all-photos/services/show_all_photos_service.dart';
import 'package:get/get.dart';

class GalleryPageController extends GetxController {
  AllPhotosService allPhotosService = AllPhotosService();
  ShowAllPhotosResponse? showAllPhotosResponse;
  RxList<ShowAllPhotosModel> showAllPhotosList = <ShowAllPhotosModel>[].obs;

  @override
  void onInit() {
    showAllPhotos();
    super.onInit();
  }

  showAllPhotos() async {
    try {
      final response = await allPhotosService.getShowAllPhotos();
      showAllPhotosResponse = ShowAllPhotosResponse.fromJson(response.data);
      showAllPhotosList.value = showAllPhotosResponse!.data;
      print(showAllPhotosList);
      update();
    } catch (e) {
      print(e);
    }
  }
}
