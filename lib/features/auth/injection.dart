import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:cinetrack/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cinetrack/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cinetrack/features/auth/domain/repositories/auth_repository.dart';
import 'package:cinetrack/features/auth/domain/usecases/login_user.dart';
import 'package:cinetrack/features/auth/domain/usecases/register_user.dart';
import 'package:cinetrack/features/auth/domain/usecases/request_password.dart';
import 'package:cinetrack/features/auth/domain/usecases/reset_password.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_reset_password.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_user/verify_user_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initAuthInjection() {
  // Data Source
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator()),
  );

  // Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: locator<AuthRemoteDataSource>(),
      storage: locator<SecureStorage>(),
    ),
  );

  // UseCase
  locator.registerLazySingleton(() => LoginUser(locator()));
  locator.registerLazySingleton(() => RegisterUser(locator()));
  locator.registerLazySingleton(() => VerifyUser(locator()));
  locator.registerLazySingleton(() => VerifyResetPassword(locator()));
  locator.registerLazySingleton(() => RequestPassword(locator()));
  locator.registerLazySingleton(() => ResetPassword(locator()));

  // Bloc
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => RegisterBloc(locator()));
  locator.registerFactory(() => VerifyUserBloc(locator()));
  locator.registerFactory(() => VerifyResetPasswordBloc(locator()));
  locator.registerFactory(() => ResetPasswordBloc(locator()));
  locator.registerFactory(() => RequestPasswordBloc(locator()));
}
