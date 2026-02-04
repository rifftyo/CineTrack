// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watched_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchedDataResponse _$WatchedDataResponseFromJson(Map<String, dynamic> json) =>
    WatchedDataResponse(
      json['message'] as String,
      (json['count'] as num).toInt(),
      (json['results'] as List<dynamic>)
          .map((e) => WatchedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchedDataResponseToJson(
  WatchedDataResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'count': instance.count,
  'results': instance.results,
};
