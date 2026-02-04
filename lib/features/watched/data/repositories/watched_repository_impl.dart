import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/watched/data/datasources/watched_remote_data_source.dart';
import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:cinetrack/features/watched/domain/repositories/watched_repository.dart';
import 'package:dartz/dartz.dart';

class WatchedRepositoryImpl implements WatchedRepository {
  final WatchedRemoteDataSource remote;

  WatchedRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<Watched>>> getWatchedMovie() async {
    try {
      final response = await remote.getWatchedMovies();

      final watched = response.results.map((e) => e.toEntity()).toList();

      return Right(watched);
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
  Future<Either<Failure, String>> postWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
    String watchedAt,
  ) async {
    try {
      final response = await remote.postWatchedMovie(
        tmdbId,
        userRating,
        review,
        watchedAt,
      );

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

  @override
  Future<Either<Failure, String>> putWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
  ) async {
    try {
      final response = await remote.putWatchedMovie(tmdbId, userRating, review);

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
