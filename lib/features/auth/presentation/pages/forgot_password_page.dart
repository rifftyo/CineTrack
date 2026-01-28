import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_state.dart';
import 'package:cinetrack/features/auth/presentation/widgets/auth_field.dart';
import 'package:cinetrack/features/auth/presentation/widgets/button_submit.dart';
import 'package:cinetrack/features/auth/presentation/widgets/footer_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    const SizedBox(width: 10),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        'Back to login',
                        style: AppTextStyle.smallWhite,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              HeaderAuth(
                title: 'Forgot Password?',
                subTitle:
                    'No worries! Enter your email address and we\'ll send you a code to reset your password',
                image: 'assets/images/icon_email.png',
              ),
              const SizedBox(height: 40),
              AuthField(
                controller: emailController,
                title: 'Email Address',
                hintText: 'your@email.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              BlocConsumer<RequestPasswordBloc, RequestPasswordState>(
                listener: (context, state) {
                  if (state is RequestPasswordSuccess) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.verifyResetPassword,
                      arguments: emailController.text.trim(),
                    );
                  } else if (state is RequestPasswordFailure) {
                    showSnack(context, state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonSubmit(
                    title: 'Send Reset Code',
                    isLoading: state is RequestPasswordLoading,
                    onTap: () {
                      final email = emailController.text.trim();

                      context.read<RequestPasswordBloc>().add(
                        RequestPasswordSubmitted(email),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              FooterAuth(
                title: 'Remember your password?',
                descTitle: 'Sign in',
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
