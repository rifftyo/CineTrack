import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, Movie>> getDetailMovie(int id);
  Future<Either<Failure, List<Movie>>> getSearchMovie(
    String? query,
    int? minRating,
    int? genre,
  );
}
