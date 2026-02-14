import 'package:cinetrack/features/watched/domain/entites/watched.dart';
import 'package:equatable/equatable.dart';

abstract class WatchedMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WatchedMovieInitial extends WatchedMovieState {}

class WatchedMovieLoading extends WatchedMovieState {}

class WatchedMovieSuccess extends WatchedMovieState {
  final List<Watched> watched;

  WatchedMovieSuccess(this.watched);

  @override
  List<Object?> get props => [watched];
}

class WatchedMovieFailure extends WatchedMovieState {
  final String error;

  WatchedMovieFailure(this.error);

  @override
  List<Object?> get props => [error];
}
