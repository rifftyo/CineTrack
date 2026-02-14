import 'package:cinetrack/features/watched/domain/usecases/send_watched_movie.dart';
import 'package:cinetrack/features/watched/presentation/bloc/add_watched_movie/add_watched_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWatchedMovieBloc extends Cubit<AddWatchedMovieState> {
  final SendWatchedMovie sendWatchedMovie;

  AddWatchedMovieBloc(this.sendWatchedMovie) : super(AddWatchedMovieInitial());

  Future<void> addWatchedMovie(
    int id,
    double rating,
    String watchedAt,
    String review,
  ) async {
    emit(AddWatchedMovieLoading());

    final result = await sendWatchedMovie.execute(
      id,
      rating,
      review,
      watchedAt,
    );

    result.fold(
      (failure) => emit(AddWatchedMovieFailure(failure.message)),
      (success) => emit(AddWatchedMovieSuccess(success)),
    );
  }
}
