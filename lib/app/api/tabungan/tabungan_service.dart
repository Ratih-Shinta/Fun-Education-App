import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class TabunganService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentTabungan() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTabungan,
        isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}