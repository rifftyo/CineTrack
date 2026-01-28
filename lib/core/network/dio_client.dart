import 'package:cinetrack/core/network/dio_interceptor.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient(SecureStorage storage) {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://5aa27c50c4db.ngrok-free.app/api",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    dio.interceptors.add(DioInterceptor(storage));
  }
}
