import 'package:cinetrack/features/movie/domain/entities/watched_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watched_data_response.g.dart';

@JsonSerializable()
class WatchedDataResponse {
  @JsonKey(name: 'user_rating')
  final double userRating;
  final String review;
  @JsonKey(name: 'watched_at')
  final String wathchedAt;

  const WatchedDataResponse(this.userRating, this.review, this.wathchedAt);

  factory WatchedDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchedDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WatchedDataResponseToJson(this);

  WatchedData toEntity() {
    return WatchedData(userRating, review, wathchedAt);
  }
}
