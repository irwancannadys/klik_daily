import 'package:dio/dio.dart';

class DioClient {

  final String apiBaseUrl;

  DioClient({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: 50000,
        receiveTimeout: 10000);
    Dio dio = Dio(options);
    return dio;
  }

}