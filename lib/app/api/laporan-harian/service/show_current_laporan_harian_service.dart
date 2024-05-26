import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class LaporanHarianService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentLaporanHarian() async {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);

    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showCurrentLaporanHarian,
          isAuthorize: true,
          queryParameters: {'date': '$formattedDate'});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
