import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/watched/domain/usecases/watched_movie.dart';
import 'package:cinetrack/features/watched/presentation/bloc/watched_movie/watched_movie_state.dart';

class WatchedMovieBloc extends Cubit<WatchedMovieState> {
  final WatchedMovie watchedMovie;

  WatchedMovieBloc(this.watchedMovie) : super(WatchedMovieInitial());

  Future<void> fetchWatchedMovie() async {
    emit(WatchedMovieLoading());

    final result = await watchedMovie.execute();

    result.fold(
      (failure) => emit(WatchedMovieFailure(failure.message)),
      (watched) => emit(WatchedMovieSuccess(watched)),
    );
  }
}
