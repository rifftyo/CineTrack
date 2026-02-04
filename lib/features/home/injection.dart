import 'package:cinetrack/features/home/data/repositories/home_repository_impl.dart';
import 'package:cinetrack/features/home/domain/repositories/home_repository.dart';
import 'package:cinetrack/features/home/domain/usecases/get_home_data.dart';
import 'package:cinetrack/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initHome() {
  // Repository
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      locator<MovieRepository>(),
      locator<ProfileRepository>(),
      locator<StatisticRepository>(),
    ),
  );

  // UseCase
  locator.registerLazySingleton(() => GetHomeData(locator()));

  // Bloc
  locator.registerFactory(() => HomeBloc(locator()));
}
