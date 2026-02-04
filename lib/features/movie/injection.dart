import 'package:cinetrack/features/movie/data/datasources/movie_data_source.dart';
import 'package:cinetrack/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:cinetrack/features/movie/domain/usecases/detail_movie.dart';
import 'package:cinetrack/features/movie/domain/usecases/now_playing_movies.dart';
import 'package:cinetrack/features/movie/domain/usecases/search_movies.dart';
import 'package:cinetrack/features/movie/domain/usecases/top_rated_movies.dart';
import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initMovieInjection() {
  // Data Source
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(locator()),
  );

  // Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remote: locator<MovieRemoteDataSource>()),
  );

  // UseCase
  locator.registerLazySingleton(() => DetailMovie(locator()));
  locator.registerLazySingleton(() => NowPlayingMovies(locator()));
  locator.registerLazySingleton(() => SearchMovie(locator()));
  locator.registerLazySingleton(() => TopRatedMovies(locator()));

  // Bloc
  locator.registerLazySingleton(() => SearchMovieBloc(locator()));
}
