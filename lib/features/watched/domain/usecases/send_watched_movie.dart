import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/watched/domain/repositories/watched_repository.dart';
import 'package:dartz/dartz.dart';

class SendWatchedMovie {
  final WatchedRepository repository;

  SendWatchedMovie(this.repository);

  Future<Either<Failure, String>> execute(
    int tmdbId,
    double userRating,
    String review,
    String watchedAt,
  ) {
    return repository.postWatchedMovie(tmdbId, userRating, review, watchedAt);
  }
}
