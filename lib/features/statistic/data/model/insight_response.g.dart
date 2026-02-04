// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightResponse _$InsightResponseFromJson(Map<String, dynamic> json) =>
    InsightResponse(
      json['message'] as String,
      json['date'] as String,
      (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InsightResponseToJson(InsightResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'date': instance.date,
      'data': instance.data,
    };
