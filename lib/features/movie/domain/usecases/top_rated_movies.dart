import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class TopRatedMovies {
  final MovieRepository repository;

  const TopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
