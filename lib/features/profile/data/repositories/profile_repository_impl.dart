import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      final response = await remote.getProfile();
      return Right(response.data.toEntity());
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
  Future<Either<Failure, String>> putProfile(
    String? fullName,
    String? userName,
    Avatar? avatar,
  ) async {
    try {
      final response = await remote.putProfile(fullName, userName, avatar);
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
