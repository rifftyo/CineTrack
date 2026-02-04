// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_genre_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteGenreResponse _$FavoriteGenreResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteGenreResponse(
  json['genre'] as String,
  (json['count'] as num).toInt(),
  (json['percentage'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteGenreResponseToJson(
  FavoriteGenreResponse instance,
) => <String, dynamic>{
  'genre': instance.genre,
  'count': instance.count,
  'percentage': instance.percentage,
};
