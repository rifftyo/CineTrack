// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovieResponse _$DetailMovieResponseFromJson(Map<String, dynamic> json) =>
    DetailMovieResponse(
      json['message'] as String,
      MovieResponse.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailMovieResponseToJson(
  DetailMovieResponse instance,
) => <String, dynamic>{'message': instance.message, 'result': instance.result};
