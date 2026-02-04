import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/watched/domain/repositories/watched_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateWatchedMovie {
  final WatchedRepository repository;

  UpdateWatchedMovie(this.repository);

  Future<Either<Failure, String>> execute(
    int tmdbId,
    double userRating,
    String review,
  ) {
    return repository.putWatchedMovie(tmdbId, userRating, review);
  }
}
