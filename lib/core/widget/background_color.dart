import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

BoxDecoration backgroundColor() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.richBlack, AppColors.deepNavy, AppColors.darkCharcoal],
      stops: [0, 0.5, 1.0],
    ),
  );
}
