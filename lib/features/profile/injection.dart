import 'package:cinetrack/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:cinetrack/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:cinetrack/features/profile/domain/usecases/profile.dart';
import 'package:cinetrack/features/profile/domain/usecases/update_profile.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initProfileInjection() {
  // Data Source
  locator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(locator()),
  );

  // Repository
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remote: locator<ProfileRemoteDataSource>()),
  );

  // UseCase
  locator.registerLazySingleton(() => Profile(locator()));
  locator.registerLazySingleton(() => UpdateProfile(locator()));

  // Bloc
  locator.registerLazySingleton(() => ProfileBloc(locator()));
}
