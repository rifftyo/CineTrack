// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watched_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchedDataResponse _$WatchedDataResponseFromJson(Map<String, dynamic> json) =>
    WatchedDataResponse(
      (json['user_rating'] as num).toDouble(),
      json['review'] as String,
      json['watched_at'] as String,
    );

Map<String, dynamic> _$WatchedDataResponseToJson(
  WatchedDataResponse instance,
) => <String, dynamic>{
  'user_rating': instance.userRating,
  'review': instance.review,
  'watched_at': instance.wathchedAt,
};
