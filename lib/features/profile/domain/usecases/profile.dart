import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class Profile {
  final ProfileRepository repository;

  Profile(this.repository);

  Future<Either<Failure, User>> execute() {
    return repository.getProfile();
  }
}
