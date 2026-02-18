import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/auth/presentation/bloc/logout/logout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutSection extends StatelessWidget {
  const LogOutSection({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF2A2F45),
          title: const Text('Log Out'),
          content: const Text(
            'Are you sure you want to log out from this account?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                context.read<LogoutBloc>().logoutUser();
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLogoutDialog(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0X30364153)),
          borderRadius: BorderRadius.circular(24),
          color: const Color(0X30FB2C36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout, color: Colors.redAccent),
            const SizedBox(width: 8),
            Text(
              'Log Out',
              style: AppTextStyle.largeWhite.copyWith(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
