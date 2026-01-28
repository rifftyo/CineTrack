import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:cinetrack/features/auth/injection.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initInjection() async {
  // External
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => DioClient(locator<SecureStorage>()));

  // Modules
  initAuthInjection();
}
