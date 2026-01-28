import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, String>> execute(String email, String password) {
    return repository.postLoginUser(email, password);
  }
}
