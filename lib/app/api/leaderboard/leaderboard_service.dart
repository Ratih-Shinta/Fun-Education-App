import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class LeaderboardService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getLeaderboardWeekly() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.baseUrlLeaderboard,
        isAuthorize: true,
        queryParameters: {'type': 'weekly'},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getLeaderboardMonthly() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.baseUrlLeaderboard,
        isAuthorize: true,
        queryParameters: {'type': 'monthly'},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
