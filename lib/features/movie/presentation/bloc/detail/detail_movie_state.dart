import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class DetailMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieSuccess extends DetailMovieState {
  final Movie movie;

  DetailMovieSuccess(this.movie);

  @override
  List<Object?> get props => [movie];
}

class DetailMovieFailure extends DetailMovieState {
  final String error;

  DetailMovieFailure(this.error);

  @override
  List<Object?> get props => [error];
}
