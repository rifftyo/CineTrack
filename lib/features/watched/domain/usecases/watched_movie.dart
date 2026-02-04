import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:cinetrack/features/watched/domain/repositories/watched_repository.dart';
import 'package:dartz/dartz.dart';

class WatchedMovie {
  final WatchedRepository repository;

  WatchedMovie(this.repository);

  Future<Either<Failure, List<Watched>>> execute() {
    return repository.getWatchedMovie();
  }
}
