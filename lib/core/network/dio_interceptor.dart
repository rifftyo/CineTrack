import 'package:cinetrack/app/main/cubit/auth_cubit.dart';
import 'package:cinetrack/core/di/injection.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final SecureStorage storage;

  DioInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      storage.clear();
      locator<AuthCubit>().logout();
    }

    handler.next(err);
  }
}
