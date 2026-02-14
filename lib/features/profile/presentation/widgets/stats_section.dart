import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/profile/presentation/widgets/stats_item.dart';
import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({
    super.key,
    required this.profile,
  });

  final User profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: StatsItem(
            icon: Icons.theaters,
            label: 'Movies Watched',
            value: profile.moviesWatched.toString(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatsItem(
            icon: Icons.star,
            label: 'Average Rating',
            value: profile.averageRating.toString(),
          ),
        ),
      ],
    );
  }
}