import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getProfile();
  Future<Either<Failure, String>> putProfile(
    String? fullName,
    String? userName,
    Avatar? avatar,
  );
}
