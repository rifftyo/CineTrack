import 'package:cinetrack/app/main/main_page.dart';
import 'package:cinetrack/app/splash/splash_page.dart';
import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/login_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/register_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/reset_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/verify_reset_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/verify_user_page.dart';
import 'package:cinetrack/features/movie/presentation/pages/detail_movie_page.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:cinetrack/features/statistic/presentation/pages/statistic_page.dart';
import 'package:cinetrack/features/watched/presentation/pages/add_watched_movie_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appPages = {
  AppRoutes.splash: (context) => const SplashPage(),
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.register: (context) => const RegisterPage(),
  AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
  AppRoutes.verifyResetPassword: (context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return VerifyResetPasswordPage(email: email);
  },
  AppRoutes.verifyUser: (context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return VerifyPage(email: email);
  },
  AppRoutes.resetPassword: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final email = args["email"] as String;
    final code = args["code"] as String;

    return ResetPasswordPage(email: email, code: code);
  },

  AppRoutes.main: (context) => const MainPage(),
  AppRoutes.detailMovie: (context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    return DetailMoviePage(id: id);
  },
  AppRoutes.addWatchedMovie: (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final id = args["id"] as int;
    final image = args["image"] as String;
    final title = args["title"] as String;
    final year = args["year"] as String;
    final ratingValue = args["ratingValue"] as double?;
    final reviewValue = args["reviewValue"] as String?;
    final watchedValue = args["watchedValue"] as String?;
    final isEdit = args["isEdit"] as bool?;

    return AddWatchedMoviePage(
      id: id,
      image: image,
      title: title,
      year: year,
      ratingValue: ratingValue,
      reviewValue: reviewValue,
      watchedValue: watchedValue,
      isEdit: isEdit ?? false,
    );
  },
  AppRoutes.statistic: (context) => const StatisticPage(),
  AppRoutes.editProfile: (context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return EditProfilePage(user: user);
  },
};
