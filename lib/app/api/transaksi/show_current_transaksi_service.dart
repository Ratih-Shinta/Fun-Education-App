import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:dio/dio.dart';

class TransaksiService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowAvailableYear() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAvailableYear,
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowAvailableMonth(String year) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAvailableMonth,
        isAuthorize: true,
        queryParameters: {'year': year},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

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

  Future<Response> getTransaksiByYearAndMonth(String month, String year) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTransaksi,
        isAuthorize: true,
        queryParameters: {'month': month, 'year': year},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
