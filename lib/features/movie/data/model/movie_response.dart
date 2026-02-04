import 'package:cinetrack/features/movie/data/model/watched_data_response.dart';
import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int id;

  @JsonKey(defaultValue: '')
  final String title;

  final String? overview;

  @JsonKey(name: 'poster_path', defaultValue: '')
  final String posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(defaultValue: 0.0)
  final double rating;

  @JsonKey(name: 'runtime')
  final int? runTime;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(defaultValue: <String>[])
  final List<String> genres;

  @JsonKey(name: 'production', defaultValue: <String>[])
  final List<String> productions;

  @JsonKey(name: 'is_watched', defaultValue: false)
  final bool isWatched;

  @JsonKey(name: 'watched_data')
  final WatchedDataResponse? watchedData;

  MovieResponse(
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.rating,
    this.runTime,
    this.releaseDate,
    this.genres,
    this.productions,
    this.isWatched,
    this.watchedData,
  );

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  Movie toEntity() {
    return Movie(
      id,
      title,
      overview,
      posterPath.isNotEmpty
          ? posterPath
          : 'https://media.istockphoto.com/id/2173059563/vector/coming-soon-image-on-white-background-no-photo-available.jpg?s=612x612&w=0&k=20&c=v0a_B58wPFNDPULSiw_BmPyhSNCyrP_d17i2BPPyDTk=',
      backdropPath,
      rating,
      runTime,
      releaseDate,
      genres,
      productions,
      isWatched,
      watchedData?.toEntity(),
    );
  }
}
