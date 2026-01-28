import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/features/auth/data/model/auth_response.dart';
import 'package:cinetrack/features/auth/data/model/message_response.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<MessageResponse> postRegisterUser(
    String email,
    String fullname,
    String username,
    String password,
  );
  Future<AuthResponse> postVerifyUser(String email, String code);
  Future<MessageResponse> postVerifyResetPassword(String email, String code);
  Future<MessageResponse> postRequestPasswordReset(String email);
  Future<MessageResponse> postResetPassword(
    String email,
    String code,
    String newPassword,
  );
  Future<AuthResponse> postLoginUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(DioClient client) : dio = client.dio;

  @override
  Future<AuthResponse> postLoginUser(String email, String password) async {
    try {
      final response = await dio.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Data tidak valid");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }

  @override
  Future<MessageResponse> postRegisterUser(
    String email,
    String fullname,
    String username,
    String password,
  ) async {
    try {
      final response = await dio.post(
        "/auth/register",
        data: {
          "email": email,
          "fullname": fullname,
          "username": username,
          "password": password,
        },
      );
      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Data tidak valid");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }

  @override
  Future<MessageResponse> postRequestPasswordReset(String email) async {
    try {
      final response = await dio.post(
        "/auth/request-password-reset",
        data: {"email": email},
      );

      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Data tidak valid");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }

  @override
  Future<MessageResponse> postResetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      final response = await dio.post(
        "/auth/reset-password",
        data: {"email": email, "code": code, "newPassword": newPassword},
      );

      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Data tidak valid");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }

  @override
  Future<MessageResponse> postVerifyResetPassword(
    String email,
    String code,
  ) async {
    try {
      final response = await dio.post(
        "/auth/verify-reset-otp",
        data: {"email": email, "code": code},
      );
      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Invalid Data");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }

  @override
  Future<AuthResponse> postVerifyUser(String email, String code) async {
    try {
      final response = await dio.post(
        "/auth/verify",
        data: {"email": email, "code": code},
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionException("No Internet Connection");
      }

      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 401) {
        throw UnauthorizedException(errorMessage ?? "Unauthorized");
      } else if (statusCode == 400) {
        throw BadRequestException(errorMessage ?? "Invalid Data");
      } else {
        throw ServerException(errorMessage ?? "Server Error");
      }
    }
  }
}
