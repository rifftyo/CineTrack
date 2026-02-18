import 'package:equatable/equatable.dart';

abstract class UpdateWatchedMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateWatchedMovieInitial extends UpdateWatchedMovieState {}

class UpdateWatchedMovieLoading extends UpdateWatchedMovieState {}

class UpdateWatchedMovieSuccess extends UpdateWatchedMovieState {
  final String message;

  UpdateWatchedMovieSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class UpdateWatchedMovieFailure extends UpdateWatchedMovieState {
  final String error;

  UpdateWatchedMovieFailure(this.error);

  @override
  List<Object?> get props => [error];
}
