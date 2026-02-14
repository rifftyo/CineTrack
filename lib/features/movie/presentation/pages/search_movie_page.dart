import 'package:cinetrack/core/constant/rating_data.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/constant/movie_genres.dart';
import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_bloc.dart';
import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_state.dart';
import 'package:cinetrack/features/movie/presentation/widgets/filter_select.dart';
import 'package:cinetrack/features/movie/presentation/widgets/movies_sub.dart';
import 'package:cinetrack/features/movie/presentation/widgets/search_movie_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final genreEntries = movieGenres.entries.toList();
  final ratingEntries = ratingData.entries.toList();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchMovieBloc>().fetchSearchMovies(null);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchMovieBloc>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore Movies",
                style: AppTextStyle.xxxLargeWhite.copyWith(fontSize: 35),
              ),
              const SizedBox(height: 15),
              SearchMovieField(searchController: _searchController),
              const SizedBox(height: 20),
              Opacity(
                opacity: 0.7,
                child: Text('Genre', style: AppTextStyle.xLargeWhite),
              ),
              const SizedBox(height: 15),
              BlocSelector<SearchMovieBloc, SearchMovieState, int?>(
                selector: (state) => state.selectedGenre,
                builder: (context, selectedGenre) {
                  return FilterSelect(
                    items: genreEntries,
                    selectedValue: selectedGenre,
                    onSelected: (genreId) {
                      bloc.selectGenre(genreId);
                      bloc.fetchSearchMovies(_searchController.text);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: 0.7,
                child: Text('Rating', style: AppTextStyle.xLargeWhite),
              ),
              const SizedBox(height: 15),
              BlocSelector<SearchMovieBloc, SearchMovieState, dynamic>(
                selector: (state) => state.selectedRating,
                builder: (context, selectedRating) {
                  return FilterSelect(
                    items: ratingEntries,
                    selectedValue: selectedRating,
                    onSelected: (rating) {
                      bloc.selectRating(rating);
                      bloc.fetchSearchMovies(_searchController.text);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
                  builder: (context, state) {
                    if (state is SearchMovieLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state is SearchMovieFailure) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyle.xLargeWhiteBold,
                        ),
                      );
                    }

                    if (state is SearchMovieSuccess) {
                      if (state.movies.isEmpty) {
                        return Center(child: Text("Movie Not Found"));
                      } else {
                        return MoviesSub(movies: state.movies);
                      }
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
