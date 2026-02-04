import 'package:cinetrack/features/statistic/data/model/statistic_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statistic_data_response.g.dart';

@JsonSerializable()
class StatisticDataResponse {
  final String message;
  final StatisticResponse data;

  const StatisticDataResponse(this.message, this.data);

  factory StatisticDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticDataResponseToJson(this);
}
