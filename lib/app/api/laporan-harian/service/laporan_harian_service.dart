import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class LaporanHarianService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentLaporanHarian(DateTime parsedDate) async {
    // DateTime today = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd').format(today);
    // DateTime parsedDate = DateTime.parse(formattedDate);
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showCurrentLaporanHarian,
          isAuthorize: true,
          queryParameters: {'date': parsedDate});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowCurrentPointMingguan() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showCurrentPoint,
          isAuthorize: true,
          queryParameters: {'type': 'weekly'});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowCurrentPointBulanan() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showCurrentPoint,
          isAuthorize: true,
          queryParameters: {'type': 'monthly'});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
