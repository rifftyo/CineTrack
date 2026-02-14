import 'package:cinetrack/core/styles/app_colors.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WatchedItemWidget extends StatelessWidget {
  const WatchedItemWidget({
    super.key,
    required this.watchedMovie,
    required this.watchedAt,
  });

  final Watched watchedMovie;
  final String watchedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Color(0X301E2939),
        border: Border.all(color: Color(0X50364153), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(watchedMovie.posterPath),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchedMovie.title,
                  style: AppTextStyle.xxxLargeWhiteBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Opacity(
                  opacity: 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month, color: AppColors.gray),
                      const SizedBox(width: 5),
                      Text(watchedAt, style: AppTextStyle.xLargeWhite),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RatingBarIndicator(
                  rating: watchedMovie.userRating,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amberAccent),
                  itemCount: 5,
                  itemSize: 20,
                  direction: Axis.horizontal,
                ),
                const SizedBox(height: 10),
                Text(watchedMovie.review, style: AppTextStyle.mediumWhite),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
