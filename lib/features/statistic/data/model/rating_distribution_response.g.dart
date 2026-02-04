// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_distribution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDistributionResponse _$RatingDistributionResponseFromJson(
  Map<String, dynamic> json,
) => RatingDistributionResponse(
  (json['rating'] as num).toDouble(),
  (json['count'] as num).toInt(),
);

Map<String, dynamic> _$RatingDistributionResponseToJson(
  RatingDistributionResponse instance,
) => <String, dynamic>{'rating': instance.rating, 'count': instance.count};
