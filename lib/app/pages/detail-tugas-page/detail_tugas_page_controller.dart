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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailTugasPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  RxBool isLoading = false.obs;
  RxBool isLoadingStoreTugas = false.obs;
  var imageFileList = <XFile>[].obs;
  RxString? statusTask = ''.obs;
  var taskId = ''.obs;

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
    taskId.value = Get.arguments.id;
    showByIdTugas(taskId.value);
    showCurrentTugasUser(taskId.value);
    update();
  }

  Future showCurrentTugasUser(String tugasId) async {
    try {
      isLoading(true);
      final response = await tugasUserService.getTugasUser(tugasId);
      showCurrentTugasUserResponse =
          ShowCurrentTugasUserResponse.fromJson(response.data);
      showCurrentTugasUserModel.value = showCurrentTugasUserResponse!.data;
      update();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  Future<void> showByIdTugas(String tugasById) async {
    isLoading(true);
    update();

    try {
      final response = await tugasService.getShowByIdTugas(tugasById);
      showByIdTugasResponse = ShowByIdTugasResponse.fromJson(response.data);
      showByIdTugasModel.value = showByIdTugasResponse!.data;
      print('showbyid ${showByIdTugasModel.value.statusTugasUser}');
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
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
      isLoadingStoreTugas(true);
      String? isNote =
          noteController.text.isNotEmpty ? noteController.text : null;

      final response = await tugasUserService.postStoreKirimTugas(
          isNote != null, taskId.value, isNote);
      if (response.data['data']['status'] == null) {
        statusTask!.value = 'null';
      } else {
        statusTask!.value = response.data['data']['status'];
      }

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

      Get.snackbar(
        'Upload Successful',
        'Tugas berhasil dikirim',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      isLoadingStoreTugas(false);
      update();
    } catch (e) {
      isLoadingStoreTugas(false);
      Get.snackbar(
        'Upload Failed',
        'Tugas gagal dikirim',
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Upload Failed Task: $e');
    }
  }
}
