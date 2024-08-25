import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class TugasUserService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getTugasUser(String tugasId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showCurrentTugasUser}$tugasId',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreKirimTugas(
    String tugasId,
    String note,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'tugas_id': tugasId,
        'note': note,
      });
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.storeKirimTugasUser,
        isAuthorize: true,
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreKirimTugasImage(
    String tugasUserId,
    File image,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'tugas_user_id': tugasUserId,
        'image': await MultipartFile.fromFile(image.path),
      });
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.storeKirimTugasUserImage,
        isAuthorize: true,
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
