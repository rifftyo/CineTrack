import 'package:cinetrack/features/movie/data/model/movie_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_movie_response.g.dart';

@JsonSerializable()
class DetailMovieResponse {
  final String message;
  final MovieResponse result;

  const DetailMovieResponse(this.message, this.result);

  factory DetailMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMovieResponseToJson(this);
}
