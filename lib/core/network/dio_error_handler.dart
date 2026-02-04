import 'package:cinetrack/core/error/exceptions.dart';
import 'package:dio/dio.dart';

Never handleDioError(DioException e) {
  if (e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.connectionTimeout) {
    throw ConnectionException("No Internet Connection");
  }

  final statusCode = e.response?.statusCode;
  final message = e.response?.data?['message'];

  switch (statusCode) {
    case 400:
      throw BadRequestException(message ?? "Invalid Data");
    case 401:
      throw UnauthorizedException(message ?? "Unauthorized");
    case 500:
      throw ServerException(message ?? "Internal Server Error");
    default:
      throw ServerException(message ?? "Unexpected Server Error");
  }
}
