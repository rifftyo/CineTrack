import 'package:json_annotation/json_annotation.dart';

part 'insight_response.g.dart';

@JsonSerializable()
class InsightResponse {
  final String message;
  final String date;
  final List<String> data;

  const InsightResponse(this.message, this.date, this.data);

  factory InsightResponse.fromJson(Map<String, dynamic> json) =>
      _$InsightResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InsightResponseToJson(this);
}
