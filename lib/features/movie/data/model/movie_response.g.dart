// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(
  Map<String, dynamic> json,
) => MovieResponse(
  (json['id'] as num).toInt(),
  json['title'] as String? ?? '',
  json['overview'] as String?,
  json['poster_path'] as String? ?? '',
  json['backdrop_path'] as String?,
  (json['rating'] as num?)?.toDouble() ?? 0.0,
  (json['runtime'] as num?)?.toInt(),
  json['release_date'] as String?,
  (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  (json['production'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  json['is_watched'] as bool? ?? false,
  json['watched_data'] == null
      ? null
      : WatchedDataResponse.fromJson(
          json['watched_data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'rating': instance.rating,
      'runtime': instance.runTime,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'production': instance.productions,
      'is_watched': instance.isWatched,
      'watched_data': instance.watchedData,
    };
