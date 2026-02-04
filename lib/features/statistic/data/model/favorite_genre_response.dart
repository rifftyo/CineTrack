import 'package:cinetrack/features/statistic/domain/entities/favorite_genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_genre_response.g.dart';

@JsonSerializable()
class FavoriteGenreResponse {
  final String genre;
  final int count;
  final int percentage;

  const FavoriteGenreResponse(this.genre, this.count, this.percentage);

  factory FavoriteGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteGenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteGenreResponseToJson(this);

  FavoriteGenre toEntity() {
    return FavoriteGenre(genre, count, percentage);
  }
}
