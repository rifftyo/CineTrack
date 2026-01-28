import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyResetPassword {
  final AuthRepository repository;

  VerifyResetPassword(this.repository);

  Future<Either<Failure, String>> execute(String email, String code) {
    return repository.postVerifyResetPassword(email, code);
  }
}
