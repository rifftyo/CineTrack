import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPassword {
  final AuthRepository repository;

  ResetPassword(this.repository);

  Future<Either<Failure, String>> execute(String email, String code, String newPassword) {
    return repository.postResetPassword(email, code, newPassword);
  }
}
