// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watched_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchedResponse _$WatchedResponseFromJson(Map<String, dynamic> json) =>
    WatchedResponse(
      json['id'] as String,
      json['tmdb_id'] as String,
      json['title'] as String,
      json['poster_path'] as String,
      (json['tmdb_rating'] as num).toDouble(),
      (json['user_rating'] as num).toDouble(),
      json['review'] as String,
      json['watched_at'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$WatchedResponseToJson(WatchedResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tmdb_id': instance.tmdbId,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'tmdb_rating': instance.tmdbRating,
      'user_rating': instance.userRating,
      'review': instance.review,
      'watched_at': instance.watchedAt,
      'created_at': instance.createdAt,
    };
