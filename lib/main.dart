import 'package:cinetrack/app/main/cubit/auth_cubit.dart';
import 'package:cinetrack/core/di/injection.dart';
import 'package:cinetrack/core/router/app_pages.dart';
import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_theme.dart';
import 'package:cinetrack/core/utils/no_transtition_builder.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/logout/logout_state.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_user/verify_user_bloc.dart';
import 'package:cinetrack/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinetrack/features/movie/presentation/bloc/detail/detail_movie_bloc.dart';
import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_bloc.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:cinetrack/features/profile/presentation/bloc/update_profile/update_profile_bloc.dart';
import 'package:cinetrack/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/add_watched_movie/add_watched_movie_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/update_watched_movie/update_watched_movie_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/watched_movie/watched_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await initInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth
        BlocProvider(create: (_) => locator<AuthCubit>()),
        BlocProvider(create: (_) => locator<LoginBloc>()),
        BlocProvider(create: (_) => locator<RegisterBloc>()),
        BlocProvider(create: (_) => locator<RequestPasswordBloc>()),
        BlocProvider(create: (_) => locator<VerifyUserBloc>()),
        BlocProvider(create: (_) => locator<VerifyResetPasswordBloc>()),
        BlocProvider(create: (_) => locator<ResetPasswordBloc>()),
        BlocProvider(create: (_) => locator<LogoutBloc>()),
        // Home
        BlocProvider(create: (_) => locator<HomeBloc>()),
        // Movie
        BlocProvider(create: (_) => locator<SearchMovieBloc>()),
        BlocProvider(create: (_) => locator<DetailMovieBloc>()),
        // Watched
        BlocProvider(create: (_) => locator<WatchedMovieBloc>()),
        BlocProvider(create: (_) => locator<AddWatchedMovieBloc>()),
        BlocProvider(create: (_) => locator<UpdateWatchedMovieBloc>()),
        // Statistic
        BlocProvider(create: (_) => locator<StatisticBloc>()),
        // Profile
        BlocProvider(create: (_) => locator<ProfileBloc>()),
        BlocProvider(create: (_) => locator<UpdateProfileBloc>()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
          }
        },

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          routes: appPages,
          theme: ThemeData(
            splashFactory: NoSplash.splashFactory,
            useMaterial3: true,
            colorScheme: kColorSchemeLight,
            fontFamily: 'Arimo',
            scaffoldBackgroundColor: Colors.transparent,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: NoTransitionsBuilder(),
                TargetPlatform.iOS: NoTransitionsBuilder(),
              },
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white,
              selectionColor: Colors.white24,
              selectionHandleColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
