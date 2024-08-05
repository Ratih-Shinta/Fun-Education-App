import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class PengajuanTabunganService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentPengajuanTabungan() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.currentPengajuanTabungan,
        isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStorePengajuanTabungan(String userId, String category) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.storePengajuanTabungan,
          isAuthorize: true,
          data: {'user_id': userId, 'category': category});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deletePengajuanTabungan(String pengajuanId) async {
    try {
      final response = await _dioInstance.deleteRequest(
          endpoint: '${ApiEndPoint.deletePengajuanTabungan}$pengajuanId',
          isAuthorize: true,
          );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}