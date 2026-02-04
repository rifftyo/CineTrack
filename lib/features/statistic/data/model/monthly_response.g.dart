// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyResponse _$MonthlyResponseFromJson(Map<String, dynamic> json) =>
    MonthlyResponse(json['month'] as String, (json['count'] as num).toInt());

Map<String, dynamic> _$MonthlyResponseToJson(MonthlyResponse instance) =>
    <String, dynamic>{'month': instance.month, 'count': instance.count};
