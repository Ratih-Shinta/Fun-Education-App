import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class CatatanDaruratService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowLatestCatatanDarurat() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showLatestCatatanDarurat,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}