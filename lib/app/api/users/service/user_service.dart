import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class UserService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showCurrentUser, isAuthorize: true);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putResetPassword(
      String email, String tokenResetPassword, String password) async {
    try {
      final response = await _dioInstance.putRequest(
          endpoint: ApiEndPoint.updateResetPassword,
          data: {
            'email': email,
            'token_reset_password': tokenResetPassword,
            'password': password
          }
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
