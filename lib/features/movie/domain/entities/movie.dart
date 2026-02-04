import 'package:cinetrack/features/movie/domain/entities/watched_data.dart';

class Movie {
  final int id;
  final String title;
  final String? overview;
  final String posterPath;
  final String? backdropPath;
  final double rating;
  final int? runTime;
  final String? releaseDate;
  final List<String>? genres;
  final List<String>? productions;
  final bool? isWatched;
  final WatchedData? watchedData;

  Movie(
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
}
