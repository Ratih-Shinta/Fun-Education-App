import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class LaporanBulananService {
  final DioInstance _dioInstance = DioInstance();
  Future<Response> getShowCurrentLaporanBulanan(int currentMonth) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentLaporanBulanan,
        isAuthorize: true,
        queryParameters: {'month': currentMonth},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
