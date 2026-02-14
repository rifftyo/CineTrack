import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/rating_distribution_chart.dart';
import 'package:flutter/material.dart';

class RatingDisributionSection extends StatelessWidget {
  const RatingDisributionSection({super.key, required this.stats});

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
              Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 8),
              Text('Rating Distribution', style: AppTextStyle.mediumWhite),
            ],
          ),
          const SizedBox(height: 25),
          RatingDistributionChart(data: stats.ratingDistribution),
        ],
      ),
    );
  }
}
