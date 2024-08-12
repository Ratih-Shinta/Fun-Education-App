import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String nickname, String password) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {'nickname': nickname, 'password': password, 'fcm_token' : fcmToken});
          print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

   Future<Response> logout() async {
    try {
      final response =  await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout,
          isAuthorize: true
      );

       return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
