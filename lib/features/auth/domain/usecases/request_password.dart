import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RequestPassword {
  final AuthRepository repository;

  RequestPassword(this.repository);

  Future<Either<Failure, String>> execute(String email) {
    return repository.postRequestPasswordReset(email);
  }
}
