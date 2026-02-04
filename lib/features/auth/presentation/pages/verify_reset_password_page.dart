import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_bloc.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_state.dart';
import 'package:cinetrack/features/auth/presentation/widgets/button_submit.dart';
import 'package:cinetrack/features/auth/presentation/widgets/footer_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/header_auth.dart';
import 'package:cinetrack/features/auth/presentation/widgets/otp_input_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetPasswordPage extends StatefulWidget {
  const VerifyResetPasswordPage({super.key, required this.email});

  final String email;

  @override
  State<VerifyResetPasswordPage> createState() =>
      _VerifyResetPasswordPageState();
}

class _VerifyResetPasswordPageState extends State<VerifyResetPasswordPage> {
  final List<TextEditingController> codeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in codeControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onCodeChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  String get verificationCode {
    return codeControllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderAuth(
                  title: 'Verify Your Email',
                  subTitle:
                      'We\'ve sent a verification code to your email address',
                  image: 'assets/images/icon_email.png',
                ),
                const SizedBox(height: 50),
                OtpInputRow(
                  controllers: codeControllers,
                  focusNodes: focusNodes,
                  onCodeChanged: onCodeChanged,
                ),
                const SizedBox(height: 20),
                FooterAuth(
                  title: 'Didn\'t receive the code?',
                  descTitle: 'Resend code',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                BlocConsumer<VerifyResetPasswordBloc, VerifyResetPasswordState>(
                  listener: (context, state) {
                    if (state is VerifyResetPasswordSuccess) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.resetPassword,
                        arguments: {
                          "email": widget.email,
                          "code": verificationCode,
                        },
                      );
                    } else if (state is VerifyResetPasswordFailure) {
                      showSnack(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    return ButtonSubmit(
                      title: 'Verify',
                      isLoading: state is VerifyResetPasswordLoading,
                      onTap: () {
                        final code = verificationCode.trim();

                        context.read<VerifyResetPasswordBloc>().verify(
                          email: widget.email,
                          code: code,
                        );
                      },
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to login', style: AppTextStyle.smallWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
