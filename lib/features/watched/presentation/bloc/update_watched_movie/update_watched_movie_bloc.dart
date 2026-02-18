import 'package:cinetrack/features/watched/domain/usecases/update_watched_movie.dart';

import 'package:cinetrack/features/watched/presentation/bloc/update_watched_movie/update_watched_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateWatchedMovieBloc extends Cubit<UpdateWatchedMovieState> {
  final UpdateWatchedMovie editWatchedMovie;

  UpdateWatchedMovieBloc(this.editWatchedMovie)
    : super(UpdateWatchedMovieInitial());

  Future<void> updateWatchedMovie(int id, double rating, String review) async {
    emit(UpdateWatchedMovieLoading());

    final result = await editWatchedMovie.execute(id, rating, review);

    result.fold(
      (failure) => emit(UpdateWatchedMovieFailure(failure.message)),
      (success) => emit(UpdateWatchedMovieSuccess(success)),
    );
  }
}
