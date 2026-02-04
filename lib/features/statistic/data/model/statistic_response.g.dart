// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticResponse _$StatisticResponseFromJson(Map<String, dynamic> json) =>
    StatisticResponse(
      (json['total_watched'] as num?)?.toInt(),
      (json['avg_rating'] as num?)?.toDouble(),
      (json['this_month'] as num?)?.toInt(),
      (json['day_streak'] as num?)?.toInt(),
      (json['monthly'] as List<dynamic>?)
          ?.map((e) => MonthlyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['favorite_genres'] as List<dynamic>?)
          ?.map(
            (e) => FavoriteGenreResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      (json['rating_distribution'] as List<dynamic>?)
          ?.map(
            (e) =>
                RatingDistributionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$StatisticResponseToJson(StatisticResponse instance) =>
    <String, dynamic>{
      'total_watched': instance.totalWatched,
      'avg_rating': instance.avgRating,
      'this_month': instance.thisMonth,
      'day_streak': instance.dayStreak,
      'monthly': instance.monthly,
      'favorite_genres': instance.favGenre,
      'rating_distribution': instance.ratingDistribution,
    };
