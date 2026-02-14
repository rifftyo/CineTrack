import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class WatchedHeaderWidget extends StatelessWidget {
  const WatchedHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Watched Movies', style: AppTextStyle.xxxLargeWhite),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.statistic);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0X50364153),
              border: Border.all(color: Color(0X501E2939), width: 2),
            ),
            child: Center(
              child: Icon(Icons.trending_up, color: AppColors.softPurple),
            ),
          ),
        ),
      ],
    );
  }
}
