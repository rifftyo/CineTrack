import 'package:cinetrack/features/statistic/data/datasources/statistic_remote_data_source.dart';
import 'package:cinetrack/features/statistic/data/repositories/statistic_repository_impl.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:cinetrack/features/statistic/domain/usecases/insights.dart';
import 'package:cinetrack/features/statistic/domain/usecases/statistics.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initStatisticInjection() {
  // Data Source
  locator.registerLazySingleton<StatisticRemoteDataSource>(
    () => StatisticRemoteDataSourceImpl(locator()),
  );

  // Repository
  locator.registerLazySingleton<StatisticRepository>(
    () => StatisticRepositoryImpl(remote: locator<StatisticRemoteDataSource>()),
  );

  // UseCase
  locator.registerLazySingleton(() => Insights(locator()));
  locator.registerLazySingleton(() => Statistics(locator()));

  // Bloc
}
