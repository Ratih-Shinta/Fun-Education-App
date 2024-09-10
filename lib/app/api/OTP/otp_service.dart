import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class OTPService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> storeSendOTP(String email) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.sendOTP,
          data: {'email': email, 'fcm_token': fcmToken});
      print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeCheckOTP(String otp, String email, bool resetPassword) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.checkOTP,
          data: {'otp': otp, 'email': email, 'reset_password' : resetPassword, 'fcm_token': fcmToken});
      print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
