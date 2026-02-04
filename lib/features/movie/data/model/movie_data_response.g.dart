// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDataResponse _$MovieDataResponseFromJson(Map<String, dynamic> json) =>
    MovieDataResponse(
      json['message'] as String,
      (json['page'] as num).toInt(),
      (json['total_pages'] as num).toInt(),
      (json['results'] as List<dynamic>)
          .map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDataResponseToJson(MovieDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
