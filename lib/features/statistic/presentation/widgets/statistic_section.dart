import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/statistic/domain/entities/stat_card_item.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:flutter/material.dart';

class StatisticSection extends StatelessWidget {
  const StatisticSection({super.key, required this.stats});

  final Statistic stats;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final item = [
          StatCardItem(
            title: 'Total Watched',
            value: stats.totalWatched.toString(),
            icon: Icons.movie_outlined,
          ),
          StatCardItem(
            title: 'Avg Rating',
            value: stats.avgRating.toString(),
            icon: Icons.star_outline,
          ),
          StatCardItem(
            title: 'This Month',
            value: stats.thisMonth.toString(),
            icon: Icons.calendar_month_outlined,
          ),
          StatCardItem(
            title: 'Day Streak',
            value: stats.dayStreak.toString(),
            icon: Icons.trending_up,
          ),
        ][index];
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0X50364153),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item.icon, color: AppColors.softPurple),
                  const SizedBox(width: 8),
                  Text(item.title, style: AppTextStyle.mediumWhite),
                ],
              ),
              const SizedBox(height: 12),
              Text(item.value, style: AppTextStyle.xxxLargeWhiteBold),
            ],
          ),
        );
      },
    );
  }
}
