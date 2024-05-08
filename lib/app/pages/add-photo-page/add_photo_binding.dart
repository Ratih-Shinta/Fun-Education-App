import 'package:get/get.dart';
import 'package:fun_education_app/app/pages/add-photo-page/add_photo_controller.dart';

class AddPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPhotoController>(() => AddPhotoController());
  }
}