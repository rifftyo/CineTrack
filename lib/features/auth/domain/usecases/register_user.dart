import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Either<Failure, String>> execute(
    String email,
    String fullname,
    String username,
    String password,
  ) async {

    return await repository.postRegisterUser(
      email,
      fullname,
      username,
      password,
    );
  }
}
