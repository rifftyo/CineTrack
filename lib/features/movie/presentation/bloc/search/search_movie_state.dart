import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class SearchMovieState extends Equatable {
  final int? selectedGenre;
  final int? selectedRating;

  const SearchMovieState({this.selectedGenre, this.selectedRating});

  @override
  List<Object?> get props => [selectedGenre, selectedRating];
}

class SearchMovieInitial extends SearchMovieState {
  const SearchMovieInitial({super.selectedGenre, super.selectedRating});
}

class SearchMovieLoading extends SearchMovieState {
  const SearchMovieLoading({super.selectedGenre, super.selectedRating});
}

class SearchMovieSuccess extends SearchMovieState {
  final List<Movie> movies;

  const SearchMovieSuccess(
    this.movies, {
    super.selectedGenre,
    super.selectedRating,
  });

  @override
  List<Object?> get props => [movies, selectedGenre, selectedRating];
}

class SearchMovieFailure extends SearchMovieState {
  final String message;

  const SearchMovieFailure(this.message, {super.selectedGenre, super.selectedRating});

  @override
  List<Object?> get props => [message, selectedGenre, selectedRating];
}
