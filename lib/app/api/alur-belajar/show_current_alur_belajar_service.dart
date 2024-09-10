import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class AlurBelajarService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentAlurBelajar() async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        endpoint: ApiEndPoint.showCurrentAlurBelajar,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}