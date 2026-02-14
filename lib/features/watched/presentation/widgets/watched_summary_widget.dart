import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:flutter/material.dart';

class WatchedSummaryWidget extends StatelessWidget {
  const WatchedSummaryWidget({super.key, required this.watchedMovies});

  final List<Watched> watchedMovies;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Text(
        '${watchedMovies.length} movies in your \ncollection',
        style: AppTextStyle.xLargeWhite,
      ),
    );
  }
}
