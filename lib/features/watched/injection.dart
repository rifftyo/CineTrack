import 'package:cinetrack/features/watched/data/datasources/watched_remote_data_source.dart';
import 'package:cinetrack/features/watched/data/repositories/watched_repository_impl.dart';
import 'package:cinetrack/features/watched/domain/usecases/send_watched_movie.dart';
import 'package:cinetrack/features/watched/domain/usecases/update_watched_movie.dart';
import 'package:cinetrack/features/watched/domain/usecases/watched_movie.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initWatchedInjection() {
  // Data Source
  locator.registerLazySingleton<WatchedRemoteDataSource>(
    () => WatchedRemoteDataSourceImpl(locator()),
  );

  // Repository
  locator.registerLazySingleton<WatchedRepositoryImpl>(
    () => WatchedRepositoryImpl(remote: locator<WatchedRemoteDataSource>()),
  );

  // UseCase
  locator.registerLazySingleton(() => SendWatchedMovie(locator()));
  locator.registerLazySingleton(() => UpdateWatchedMovie(locator()));
  locator.registerLazySingleton(() => WatchedMovie(locator()));

  // Bloc
}
