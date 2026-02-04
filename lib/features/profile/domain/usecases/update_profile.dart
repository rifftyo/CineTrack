import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfile {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  Future<Either<Failure, String>> execute(
    String? fullName,
    String? userName,
    Avatar? avatar,
  ) {
    return repository.putProfile(fullName, userName, avatar);
  }
}
