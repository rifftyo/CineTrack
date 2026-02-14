import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/watched/presentation/pages/add_watched_movie_page.dart';
import 'package:flutter/material.dart';

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({super.key, required this.widget});

  final AddWatchedMoviePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x50364153),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(
              widget.image,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyle.xLargeWhite),
                const SizedBox(height: 5),
                Text(
                  widget.year,
                  style: AppTextStyle.largeWhite.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
