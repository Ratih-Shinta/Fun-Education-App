import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_model.dart';
import 'package:fun_education_app/app/api/shift-masuk/models/shift_masuk_response.dart';

class ShiftMasukService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getCurrentShiftMasuk() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentShiftMasuk,
        isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
