import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_state.dart';
import 'package:cinetrack/features/auth/presentation/widgets/auth_field.dart';
import 'package:cinetrack/features/auth/presentation/widgets/button_submit.dart';
import 'package:cinetrack/features/auth/presentation/widgets/footer_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/header_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderAuth(
                  title: 'Create Account',
                  subTitle: 'Join us and start tracking movies',
                  image: 'assets/images/icon_cinetrack.png',
                ),
                const SizedBox(height: 40),

                AuthField(
                  controller: fullNameController,
                  title: 'Full Name',
                  hintText: 'John Doe',
                  icon: Icons.person_2_outlined,
                ),
                const SizedBox(height: 20),

                AuthField(
                  controller: usernameController,
                  title: 'Username',
                  hintText: 'johndoe',
                  icon: Icons.person_2_outlined,
                ),
                const SizedBox(height: 20),

                AuthField(
                  controller: emailController,
                  title: 'Email',
                  hintText: 'your@email.com',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),

                AuthField(
                  controller: passwordController,
                  title: 'Password',
                  hintText: 'Create a password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                AuthField(
                  controller: confirmPasswordController,
                  title: 'Confirm Password',
                  hintText: 'Confirm your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.verifyUser,
                        arguments: emailController.text.trim(),
                      );
                    } else if (state is RegisterFailure) {
                      showSnack(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    return ButtonSubmit(
                      title: 'Register',
                      isLoading: state is RegisterLoading,
                      onTap: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        final confirmPassword = confirmPasswordController.text
                            .trim();
                        final fullName = fullNameController.text;
                        final username = usernameController.text.trim();

                        if (password != confirmPassword) {
                          return showSnack(context, "Passwords do not match");
                        }

                        context.read<RegisterBloc>().add(
                          RegisterSubmitted(
                            email,
                            fullName,
                            username,
                            password,
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                FooterAuth(
                  title: 'Already have an account?',
                  descTitle: 'Sign In',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
