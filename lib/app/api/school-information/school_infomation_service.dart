import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class SchoolInfomationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowSchoolInformation() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showSchoolInformation,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
