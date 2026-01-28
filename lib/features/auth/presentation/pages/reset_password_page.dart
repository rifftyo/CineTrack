import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:cinetrack/features/auth/presentation/widgets/auth_field.dart';
import 'package:cinetrack/features/auth/presentation/widgets/button_submit.dart';
import 'package:cinetrack/features/auth/presentation/widgets/footer_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderAuth(
                title: 'Enter A New Password',
                subTitle: '',
                image: 'assets/images/icon_cinetrack.png',
              ),
              const SizedBox(height: 40),
              AuthField(
                controller: passwordController,
                title: 'New Password',
                hintText: 'your new password',
                isPassword: true,
                icon: Icons.lock_outline,
              ),
              const SizedBox(height: 20),
              BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    showSnack(context, 'Update Password Success');
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  } else if (state is ResetPasswordFailure) {
                    showSnack(context, state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonSubmit(
                    title: 'Update Password',
                    isLoading: state is ResetPasswordLoading,
                    onTap: () {
                      final newPassword = passwordController.text.trim();

                      context.read<ResetPasswordBloc>().add(
                        ResetPasswordSubmitted(
                          widget.email,
                          widget.code,
                          newPassword,
                        ),
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
