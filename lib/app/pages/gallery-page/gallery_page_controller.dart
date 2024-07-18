import 'package:fun_education_app/app/api/album-photos/models/show_all_album_photo_model.dart';
import 'package:fun_education_app/app/api/album-photos/models/show_all_album_photo_response.dart';
import 'package:fun_education_app/app/api/album-photos/services/show_all_album_photo_service.dart';
import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_model.dart';
import 'package:fun_education_app/app/api/all-photos/models/show_all_photos_response.dart';
import 'package:fun_education_app/app/api/all-photos/services/show_all_photos_service.dart';
import 'package:get/get.dart';

class GalleryPageController extends GetxController {
  RxBool isLoadingAllPhotos = false.obs;
  RxBool isLoadingAllAlbumPhoto = false.obs;

  AllPhotosService allPhotosService = AllPhotosService();
  ShowAllPhotosResponse? showAllPhotosResponse;
  RxList<ShowAllPhotosModel> showAllPhotosModel = <ShowAllPhotosModel>[].obs;

  AlbumPhotoService albumPhotoService = AlbumPhotoService();
  ShowAllAlbumPhotoResponse? showAllAlbumPhotoResponse;
  RxList<ShowAllAlbumPhotoModel> showAllAlbumPhotoModel =
      <ShowAllAlbumPhotoModel>[].obs;

  @override
  void onInit() {
    showAllPhotos();
    showAllAlbum();
    super.onInit();
  }

  showAllPhotos() async {
    try {
      isLoadingAllPhotos(true);
      final response = await allPhotosService.getShowAllPhotos();
      showAllPhotosResponse = ShowAllPhotosResponse.fromJson(response.data);
      showAllPhotosModel.value = showAllPhotosResponse!.data;
      // print(showAllPhotosModel);
      update();
    } catch (e) {
      isLoadingAllPhotos(true);
      print(e);
    } finally {
      isLoadingAllPhotos(false);
    }
  }

  showAllAlbum() async {
    try {
      isLoadingAllAlbumPhoto(true);
      final response = await albumPhotoService.getShowAllAlbumPhoto();
      showAllAlbumPhotoResponse =
          ShowAllAlbumPhotoResponse.fromJson(response.data);
      showAllAlbumPhotoModel.value = showAllAlbumPhotoResponse!.data;
      // print(showAllAlbumPhotoModel[1].gallery!.length);
      print(showAllAlbumPhotoModel[0].desc);
      update();
    } catch (e) {
      isLoadingAllAlbumPhoto(true);
      print(e);
    } finally {
      isLoadingAllAlbumPhoto(false);
    }
  }
}
