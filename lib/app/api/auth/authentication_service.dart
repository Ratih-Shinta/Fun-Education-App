import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String email, String password) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {
            'email': email,
            'password': password,
            'fcm_token': fcmToken
          });
      print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> register(
    String fullName,
    String nickname,
    String email,
    String birth,
    String address,
    String shift,
    String password,
    String gender,
  ) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.register,
        data: {
          'full_name': fullName,
          'nickname': nickname,
          'email' : email,
          'birth': birth,
          'address': address,
          'shift': shift,
          'password': password,
          'gender': gender,
          'fcm_token': fcmToken
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> logout() async {
    try {
      final response = await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout, isAuthorize: true);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
