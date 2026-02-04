import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';

class HomeData {
  final List<Movie> nowPlayingMovies;
  final List<Movie> topRatedMovies;
  final User profile;
  final Statistic statistic;

  const HomeData(
    this.nowPlayingMovies,
    this.topRatedMovies,
    this.profile,
    this.statistic,
  );
}
