import 'package:cinetrack/features/statistic/domain/entities/monthly.dart';
import 'package:json_annotation/json_annotation.dart';

part 'monthly_response.g.dart';

@JsonSerializable()
class MonthlyResponse {
  final String month;
  final int count;

  const MonthlyResponse(this.month, this.count);

  factory MonthlyResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthlyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyResponseToJson(this);

  Monthly toEntity() {
    return Monthly(month, count);
  }
}
