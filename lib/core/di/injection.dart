import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:cinetrack/features/auth/injection.dart';
import 'package:cinetrack/features/home/injection.dart';
import 'package:cinetrack/features/movie/injection.dart';
import 'package:cinetrack/features/profile/injection.dart';
import 'package:cinetrack/features/statistic/injection.dart';
import 'package:cinetrack/features/watched/injection.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initInjection() async {
  // External
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => DioClient(locator<SecureStorage>()));

  // Modules
  initAuthInjection();
  initMovieInjection();
  initProfileInjection();
  initStatisticInjection();
  initWatchedInjection();
  initHome();
}
