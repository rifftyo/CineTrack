import 'package:cinetrack/features/statistic/domain/entities/rating_distribution.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_distribution_response.g.dart';

@JsonSerializable()
class RatingDistributionResponse {
  final double rating;
  final int count;

  const RatingDistributionResponse(this.rating, this.count);

  factory RatingDistributionResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingDistributionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingDistributionResponseToJson(this);

  RatingDistribution toEntity() {
    return RatingDistribution(rating, count);
  }
}
