import 'package:dio/dio.dart';
import 'package:fun_education_app/app/api/api_endpoint.dart';
import 'package:fun_education_app/app/api/dio_instance.dart';

class TugasService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getCurrentTugas() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTugas,
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getCurrentTugasTerbaru() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTugas,
        isAuthorize: true,
        queryParameters: {'status': 'Terbaru'},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getCurrentTugasDiperiksa() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTugas,
        isAuthorize: true,
        queryParameters: {'status': 'Diperiksa'},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getCurrentTugasSelesai() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentTugas,
        isAuthorize: true,
        queryParameters: {'status': 'Selesai'},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
  
  Future<Response> getShowByIdTugas(String tugasId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByIdTugas}$tugasId',
        isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
