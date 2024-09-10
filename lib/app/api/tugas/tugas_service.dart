import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class TugasService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getCurrentTugas(String status) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTugas,
        isAuthorize: true,
        queryParameters: {'status': status},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByIdTugas(String tugasId) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.showByIdTugas}$tugasId', isAuthorize: true);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
