import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show_current_image_tugas_user_model.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show_current_tugas_user_model.dart';
import 'package:fun_education_app/app/api/tugas-user/models/show_current_tugas_user_response.dart';
import 'package:fun_education_app/app/api/tugas-user/service/tugas_user_service.dart';
import 'package:fun_education_app/app/api/tugas/models/show-by-id-tugas/show_current_by_id_response.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_image_model.dart';
import 'package:fun_education_app/app/api/tugas/models/show-current-tugas/show_current_tugas_model.dart';
import 'package:fun_education_app/app/api/tugas/service/tugas_service.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailTugasPageController extends GetxController {
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  RxBool isLoading = false.obs;
  var imageFileList = <XFile>[].obs;
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController noteController = TextEditingController();

  TugasService tugasService = TugasService();
  ShowByIdTugasResponse? showByIdTugasResponse;
  Rx<ShowCurrentTugasModel> showByIdTugasModel = ShowCurrentTugasModel().obs;
  RxList<ShowCurrentTugasImageModel> showCurrentTugasImageModel =
      <ShowCurrentTugasImageModel>[].obs;

  TugasUserService tugasUserService = TugasUserService();
  ShowCurrentTugasUserResponse? showCurrentTugasUserResponse;
  Rx<ShowCurrentTugasUserModel> showCurrentTugasUserModel =
      ShowCurrentTugasUserModel().obs;
  RxList<ShowCurrentImageTugasUserModel> showCurrentImageTugasUserModel =
      <ShowCurrentImageTugasUserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showByIdTugas(Get.arguments.id);
    showCurrentTugasUser(Get.arguments.id);
  }

  Future showCurrentTugasUser(String tugasId) async {
    try {
      isLoading(true);
      final response = await tugasUserService.getTugasUser(tugasId);
      showCurrentTugasUserResponse =
          ShowCurrentTugasUserResponse.fromJson(response.data);
      showCurrentTugasUserModel.value = showCurrentTugasUserResponse!.data;
      update();
      print('showCurrentTugasUser ${showCurrentTugasUserModel.value.status}');
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
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

  void deleteImage(int index) {
    imageFileList.removeAt(index);
  }

  void selectImage() async {
    final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage != null && selectedImage.isNotEmpty) {
      imageFileList.addAll(selectedImage);
    }
  }

  Future<void> storeKirimTaskUser() async {
    try {
      final response = await tugasUserService.postStoreKirimTugas(
        Get.arguments.id,
        noteController.text,
      );
      final responseData = response.data;
      final tugasUserId = responseData['data']['id'].toString();
      print('Task created with ID: $tugasUserId');

      if (imageFileList.isNotEmpty) {
        final responseData = response.data;
        final tugasUserId = responseData['data']['id'].toString();
        print('Task created with ID: $tugasUserId');
        List<File> files =
            imageFileList.map((xfile) => File(xfile.path)).toList();

        for (var file in files) {
          final responseImage = await tugasUserService.postStoreKirimTugasImage(
            tugasUserId,
            file,
          );

          if (responseImage.statusCode == 201) {
            print('Upload successful: ${response.data}');
          } else {
            print('Upload Failed Task: ${responseImage.statusCode}');
          }
        }
      }

      Get.back();

      Get.snackbar(
        'Upload Successful',
        'Album berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      update();
    } catch (e) {
      Get.snackbar(
        'Upload Failed',
        'Album gagal ditambahkan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Upload Failed Task: $e');
    }
  }
}
