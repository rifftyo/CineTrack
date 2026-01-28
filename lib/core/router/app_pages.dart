import 'package:cinetrack/app/main/main_page.dart';
import 'package:cinetrack/app/splash/splash_page.dart';
import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/login_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/register_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/reset_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/verify_reset_password_page.dart';
import 'package:cinetrack/features/auth/presentation/pages/verify_user_page.dart';
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
};
