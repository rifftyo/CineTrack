import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class DetailMovie {
  final MovieRepository repository;

  const DetailMovie(this.repository);

  Future<Either<Failure, Movie>> execute(int id) {
    return repository.getDetailMovie(id);
  }
}
