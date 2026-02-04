import 'package:cinetrack/features/home/presentation/widgets/statistic_item.dart';
import 'package:flutter/material.dart';

class StatisticSub extends StatelessWidget {
  const StatisticSub({
    super.key,
    required this.totalWatched,
    required this.avgRating,
  });

  final String totalWatched;
  final String avgRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: StatisticItem(
            asset: 'assets/images/eye_icon.png',
            desc: 'Movies Watched',
            value: totalWatched,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatisticItem(
            asset: 'assets/images/star_icon.png',
            desc: 'Average Rating',
            value: avgRating,
          ),
        ),
      ],
    );
  }
}
