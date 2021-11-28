import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;
  ApiService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'http://192.168.1.6:3000/api',
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        "accept": "application/json",
      },
    );
    _dio = Dio(baseOptions);
  }

  Future<dynamic> get(path) async {
    Response response = await _dio.get(path);
    var data = response.data;
    return data;
  }

  Future<dynamic> post(path, dynamic body) async {
    Response response = await _dio.post(path, data: body);
    var data = response.data;
    return data;
  }
}
