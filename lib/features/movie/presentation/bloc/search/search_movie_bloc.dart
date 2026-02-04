import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/movie/domain/usecases/search_movies.dart';
import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_state.dart';

class SearchMovieBloc extends Cubit<SearchMovieState> {
  final SearchMovie searchMovie;

  int? selectedGenre;
  int? selectedRating;

  SearchMovieBloc(this.searchMovie)
    : super(SearchMovieInitial(selectedGenre: null, selectedRating: null));

  void selectGenre(int? genre) {
    selectedGenre = genre;

    emit(
      SearchMovieInitial(
        selectedGenre: selectedGenre,
        selectedRating: selectedRating,
      ),
    );
  }

  void selectRating(int? rating) {
    selectedRating = rating;

    emit(
      SearchMovieInitial(
        selectedGenre: selectedGenre,
        selectedRating: selectedRating,
      ),
    );
  }

  Future<void> fetchSearchMovies(String? query) async {
    final trimmedQuery = query?.trim();

    emit(
      SearchMovieLoading(
        selectedGenre: selectedGenre,
        selectedRating: selectedRating,
      ),
    );

    final result = await searchMovie.execute(
      trimmedQuery,
      selectedGenre,
      selectedRating,
    );

    result.fold(
      (failure) => emit(
        SearchMovieFailure(
          failure.message,
          selectedGenre: selectedGenre,
          selectedRating: selectedRating,
        ),
      ),
      (movies) => emit(
        SearchMovieSuccess(
          movies,
          selectedGenre: selectedGenre,
          selectedRating: selectedRating,
        ),
      ),
    );
  }
}
