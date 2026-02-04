import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:dartz/dartz.dart';

abstract class WatchedRepository {
  Future<Either<Failure, String>> postWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
    String watchedAt,
  );
  Future<Either<Failure, List<Watched>>> getWatchedMovie();
  Future<Either<Failure, String>> putWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
  );
}
