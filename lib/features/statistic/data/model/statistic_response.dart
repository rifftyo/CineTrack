import 'package:cinetrack/features/statistic/data/model/favorite_genre_response.dart';
import 'package:cinetrack/features/statistic/data/model/monthly_response.dart';
import 'package:cinetrack/features/statistic/data/model/rating_distribution_response.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statistic_response.g.dart';

@JsonSerializable()
class StatisticResponse {
  @JsonKey(name: 'total_watched')
  final int? totalWatched;

  @JsonKey(name: 'avg_rating')
  final double? avgRating;

  @JsonKey(name: 'this_month')
  final int? thisMonth;

  @JsonKey(name: 'day_streak')
  final int? dayStreak;

  final List<MonthlyResponse>? monthly;

  @JsonKey(name: 'favorite_genres')
  final List<FavoriteGenreResponse>? favGenre;

  @JsonKey(name: 'rating_distribution')
  final List<RatingDistributionResponse>? ratingDistribution;

  const StatisticResponse(
    this.totalWatched,
    this.avgRating,
    this.thisMonth,
    this.dayStreak,
    this.monthly,
    this.favGenre,
    this.ratingDistribution,
  );

  factory StatisticResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticResponseToJson(this);

  Statistic toEntity() {
    return Statistic(
      totalWatched ?? 0,
      avgRating ?? 0.0,
      thisMonth ?? 0,
      dayStreak ?? 0,
      monthly?.map((e) => e.toEntity()).toList() ?? const [],
      favGenre?.map((e) => e.toEntity()).toList() ?? const [],
      ratingDistribution?.map((e) => e.toEntity()).toList() ?? const [],
    );
  }
}
