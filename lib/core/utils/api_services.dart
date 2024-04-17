import 'package:dio/dio.dart';
import 'package:route_it/core/utils/shared_prefrences.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'http://192.168.174.1:8000/api/';
  ApiService(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endpoint,
      required String bearerToken,
      Map<String, dynamic>? queryParameters}) async {
    //String? myToken = SharedPref.getData(key: 'token');
   // _dio.options.headers['Authorization'] = 'Bearer $myToken';
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post('$_baseUrl$endpoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> postWithToken(
      {required String endpoint,
      required Map<String, dynamic> data,
      required String bearerToken}) async {
    //String? myToken = SharedPref.getData(key: 'token');
    //_dio.options.headers['Authorization'] = 'Bearer $myToken';
    var response = await _dio.post('$_baseUrl$endpoint', data: data);
    return response.data;
  }
}
