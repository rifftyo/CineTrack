import 'package:cinetrack/features/movie/presentation/bloc/search/search_movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovieField extends StatelessWidget {
  const SearchMovieField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: (value) {
        context.read<SearchMovieBloc>().fetchSearchMovies(value);
      },
      decoration: InputDecoration(
        hintText: 'Search movie...',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Color(0X501E2939),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
