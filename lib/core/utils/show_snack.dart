import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

void showSnack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: AppTextStyle.mediumBlack),
    ),
  );
}
