import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/movie/domain/usecases/detail_movie.dart';
import 'package:cinetrack/features/movie/presentation/bloc/detail/detail_movie_state.dart';

class DetailMovieBloc extends Cubit<DetailMovieState> {
  final DetailMovie detailMovie;

  DetailMovieBloc(this.detailMovie) : super(DetailMovieInitial());

  Future<void> fetchDetailMovie({required int id}) async {
    emit(DetailMovieLoading());

    final result = await detailMovie.execute(id);

    result.fold(
      (failure) => emit(DetailMovieFailure(failure.message)),
      (movie) => emit(DetailMovieSuccess(movie)),
    );
  }
}
