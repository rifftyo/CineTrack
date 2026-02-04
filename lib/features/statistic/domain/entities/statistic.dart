import 'package:cinetrack/features/statistic/domain/entities/favorite_genre.dart';
import 'package:cinetrack/features/statistic/domain/entities/monthly.dart';
import 'package:cinetrack/features/statistic/domain/entities/rating_distribution.dart';

class Statistic {
  final int totalWatched;
  final double avgRating;
  final int thisMonth;
  final int dayStreak;
  final List<Monthly> monthly;
  final List<FavoriteGenre> favGenre;
  final List<RatingDistribution> ratingDistribution;

  const Statistic(
    this.totalWatched,
    this.avgRating,
    this.thisMonth,
    this.dayStreak,
    this.monthly,
    this.favGenre,
    this.ratingDistribution,
  );
}
