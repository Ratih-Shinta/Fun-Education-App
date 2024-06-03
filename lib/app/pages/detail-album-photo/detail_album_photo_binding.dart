import 'package:fun_education_app/app/pages/detail-album-photo/detail_album_photo_controller.dart';
import 'package:get/get.dart';

class DetailAlbumPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAlbumPhotoController>(
      () => DetailAlbumPhotoController(),
    );
  }
}