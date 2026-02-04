import 'package:cinetrack/features/movie/data/model/movie_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_data_response.g.dart';

@JsonSerializable()
class MovieDataResponse {
  final String message;
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<MovieResponse> results;

  const MovieDataResponse(
    this.message,
    this.page,
    this.totalPages,
    this.results,
  );

  factory MovieDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataResponseToJson(this);
}
