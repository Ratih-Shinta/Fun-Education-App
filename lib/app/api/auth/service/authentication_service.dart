import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String nama_lengkap, String password) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {'nama_lengkap': nama_lengkap, 'password': password});

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
