import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:cinetrack/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final SecureStorage storage;

  AuthRepositoryImpl({required this.remote, required this.storage});

  @override
  Future<Either<Failure, String>> postLoginUser(
    String email,
    String password,
  ) async {
    try {
      final response = await remote.postLoginUser(email, password);
      await storage.saveToken(response.token);
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> postRegisterUser(
    String email,
    String fullname,
    String username,
    String password,
  ) async {
    try {
      final response = await remote.postRegisterUser(
        email,
        fullname,
        username,
        password,
      );
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> postRequestPasswordReset(String email) async {
    try {
      final response = await remote.postRequestPasswordReset(email);
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> postResetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    try {
      final response = await remote.postResetPassword(email, code, newPassword);
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> postVerifyUser(
    String email,
    String code,
  ) async {
    try {
      final response = await remote.postVerifyUser(email, code);
      await storage.saveToken(response.token);
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> postVerifyResetPassword(
    String email,
    String code,
  ) async {
    try {
      final response = await remote.postVerifyResetPassword(email, code);
      return Right(response.message);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }
}
