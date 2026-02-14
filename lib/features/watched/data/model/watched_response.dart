import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watched_response.g.dart';

@JsonSerializable()
class WatchedResponse {
  final String id;
  @JsonKey(name: 'tmdb_id')
  final int tmdbId;
  final String title;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'tmdb_rating')
  final double tmdbRating;
  @JsonKey(name: 'user_rating')
  final double userRating;
  final String review;
  @JsonKey(name: 'watched_at')
  final String watchedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const WatchedResponse(
    this.id,
    this.tmdbId,
    this.title,
    this.posterPath,
    this.tmdbRating,
    this.userRating,
    this.review,
    this.watchedAt,
    this.createdAt,
  );

  factory WatchedResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WatchedResponseToJson(this);

  Watched toEntity() {
    return Watched(
      id,
      tmdbId,
      title,
      posterPath,
      tmdbRating,
      userRating,
      review,
      watchedAt,
      createdAt,
    );
  }
}
