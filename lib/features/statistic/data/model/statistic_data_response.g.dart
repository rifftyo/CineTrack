// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticDataResponse _$StatisticDataResponseFromJson(
  Map<String, dynamic> json,
) => StatisticDataResponse(
  json['message'] as String,
  StatisticResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatisticDataResponseToJson(
  StatisticDataResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
