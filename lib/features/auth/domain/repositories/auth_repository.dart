import 'package:cinetrack/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> postRegisterUser(
    String email,
    String fullname,
    String username,
    String password,
  );
  Future<Either<Failure, String>> postVerifyUser(String email, String code);
  Future<Either<Failure, String>> postVerifyResetPassword(
    String email,
    String code,
  );
  Future<Either<Failure, String>> postRequestPasswordReset(String email);
  Future<Either<Failure, String>> postResetPassword(
    String email,
    String code,
    String newPassword,
  );
  Future<Either<Failure, String>> postLoginUser(String email, String password);
  Future<Either<Failure, void>> logout();
}
