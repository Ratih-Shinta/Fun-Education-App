import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class TransaksiService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentTransaksi() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTransaksi,
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getTransaksiByMonth(String month) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTransaksi,
        isAuthorize: true,
        queryParameters: {
          'month': month,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}