import 'package:dio/dio.dart';

class RestClient {
  final Dio _dio = Dio(BaseOptions(
      responseType: ResponseType.json,
      headers: {
        "content-Type" : "application/json"
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)
  ));

  static final RestClient _instance = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instance;

  RestClient._internal();
}