import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/monthly_bar_cart.dart';
import 'package:flutter/material.dart';

class MoviesWatchedSection extends StatelessWidget {
  const MoviesWatchedSection({super.key, required this.stats});

  final Statistic stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0X50364153),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.trending_up, color: AppColors.softPurple),
              const SizedBox(width: 8),
              Text('Movies Watched', style: AppTextStyle.mediumWhite),
            ],
          ),
          const SizedBox(height: 25),
          MonthlyBarChart(data: stats.monthly),
        ],
      ),
    );
  }
}
