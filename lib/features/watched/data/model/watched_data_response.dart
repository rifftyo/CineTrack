import 'package:cinetrack/features/watched/data/model/watched_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watched_data_response.g.dart';

@JsonSerializable()
class WatchedDataResponse {
  final String message;
  final int count;
  final List<WatchedResponse> results;

  const WatchedDataResponse(this.message, this.count, this.results);

  factory WatchedDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchedDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WatchedDataResponseToJson(this);
}
