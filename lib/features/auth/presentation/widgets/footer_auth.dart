import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FooterAuth extends StatelessWidget {
  const FooterAuth({
    super.key,
    required this.title,
    required this.descTitle,
    required this.onTap,
  });

  final String title;
  final String descTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(opacity: 0.7, child: Text(title)),
        SizedBox(width: 10),
        TextButton(
          onPressed: onTap,
          child: Text(descTitle, style: TextStyle(color: AppColors.softPurple)),
        ),
      ],
    );
  }
}
