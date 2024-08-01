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
}