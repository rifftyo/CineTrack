import 'package:cinetrack/app/main/cubit/auth_cubit.dart';
import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_state.dart';
import 'package:cinetrack/core/widget/form_field_widget.dart';
import 'package:cinetrack/core/widget/button_submit.dart';
import 'package:cinetrack/features/auth/presentation/widgets/footer_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                title: 'Welcome Back',
                subTitle: 'Sign in to continue',
                image: 'assets/images/icon_cinetrack.png',
              ),
              const SizedBox(height: 40),
              FormFieldWidget(
                controller: emailController,
                title: 'Email',
                hintText: 'your@email.com',
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              FormFieldWidget(
                controller: passwordController,
                title: 'Password',
                hintText: 'Enter Your Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyle.smallWhite.copyWith(
                      color: AppColors.softPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    showSnack(context, state.message);
                    context.read<AuthCubit>().loginSuccess();
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(AppRoutes.main, (route) => false);
                  } else if (state is LoginFailure) {
                    showSnack(context, state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonSubmit(
                    title: 'Login',
                    isLoading: state is LoginLoading,
                    onTap: () {
                      final email = emailController.text.trim();
                      final pass = passwordController.text.trim();

                      context.read<LoginBloc>().login(
                        email: email,
                        password: pass,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              FooterAuth(
                title: 'Don\'t have an account?',
                descTitle: 'Create Account',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
