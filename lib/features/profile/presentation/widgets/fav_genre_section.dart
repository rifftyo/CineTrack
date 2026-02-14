import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:flutter/material.dart';

class FavGenreSection extends StatelessWidget {
  const FavGenreSection({
    super.key,
    required this.profile,
  });

  final User profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0X30364153)),
        borderRadius: BorderRadius.circular(24),
        color: Color(0X301E2939),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'Favorite Genre',
                style: AppTextStyle.largeWhite.copyWith(
                  color: Color(0XFF99A1AF),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.favoriteGenre,
                style: AppTextStyle.xxLargeWhite,
              ),
            ],
          ),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0X20AD46FF),
            ),
            child: Icon(
              Icons.movie_creation_outlined,
              color: AppColors.softPurple,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
