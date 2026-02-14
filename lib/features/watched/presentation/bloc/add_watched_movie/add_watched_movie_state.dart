import 'package:equatable/equatable.dart';

abstract class AddWatchedMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddWatchedMovieInitial extends AddWatchedMovieState {}

class AddWatchedMovieLoading extends AddWatchedMovieState {}

class AddWatchedMovieSuccess extends AddWatchedMovieState {
  final String message;

  AddWatchedMovieSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AddWatchedMovieFailure extends AddWatchedMovieState {
  final String error;

  AddWatchedMovieFailure(this.error);

  @override
  List<Object?> get props => [error];
}
