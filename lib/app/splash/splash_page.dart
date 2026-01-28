// ignore_for_file: use_build_context_synchronously

import 'dart:math' as math;

import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/storage/secure_storage.dart';
import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final storage = SecureStorage();
    final token = await storage.getToken();

    await Future.delayed(const Duration(seconds: 2));

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_cinetrack.png', width: 120),
            const SizedBox(height: 20),
            Text(
              'CineTrack',
              style: AppTextStyle.xxxLargeWhiteBold.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 10),
            Text(
              'Track, Rate, Remember Movie',
              style: AppTextStyle.largeWhite.copyWith(
                color: AppColors.blueGrey,
              ),
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double delay = index * 0.2;
                    double value = math.sin(
                      (_controller.value * 2 * math.pi) - (delay * math.pi),
                    );

                    return Transform.translate(
                      offset: Offset(0, value * 8),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
