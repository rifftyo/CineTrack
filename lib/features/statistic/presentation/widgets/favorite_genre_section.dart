import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:flutter/material.dart';

class FavoriteGenresSection extends StatelessWidget {
  const FavoriteGenresSection({super.key, required this.stats});

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
              Icon(Icons.military_tech, color: AppColors.softPurple),
              const SizedBox(width: 8),
              Text('Favorite Genres', style: AppTextStyle.mediumWhite),
            ],
          ),
          const SizedBox(height: 25),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: stats.favGenre.length,
            itemBuilder: (context, index) {
              final genre = stats.favGenre[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(genre.genre, style: AppTextStyle.smallWhite),
                      Text(
                        genre.count.toString(),
                        style: AppTextStyle.smallWhite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: genre.percentage / 100,
                      minHeight: 6,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.softPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
