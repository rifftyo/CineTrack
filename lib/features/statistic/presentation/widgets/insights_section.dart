import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key, required this.insights});

  final List<String> insights;

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
          Text('Insights', style: AppTextStyle.mediumWhite),
          const SizedBox(height: 25),
          ...List.generate(insights.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: AppColors.softPurple, size: 12),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      insights[index],
                      style: AppTextStyle.smallWhite,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}