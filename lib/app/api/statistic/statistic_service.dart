import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class StatisticService {
  final DioInstance _dioInstance = DioInstance();

  // Future<Response> getStatisticCurrentTugas(String amount) async {
  //   try {
  //     final response = await _dioInstance.getRequest(
  //       endpoint: ApiEndPoint.showStatisticCurrentTugas,
  //       isAuthorize: true,
  //       queryParameters: {'amount': amount},
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Response> getStatisticCurrentTugas(String type) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showStatisticCurrentTugas,
        isAuthorize: true,
        queryParameters: {'type': type},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<Response> getStatisticCurrentLaporan(String amount) async {
  //   try {
  //     final response = await _dioInstance.getRequest(
  //       endpoint: ApiEndPoint.showStatisticCurrentLaporan,
  //       isAuthorize: true,
  //       queryParameters: {'amount': amount},
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Response> getStatisticCurrentLaporan(String type) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showStatisticCurrentLaporan,
        isAuthorize: true,
        queryParameters: {'type': type},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}