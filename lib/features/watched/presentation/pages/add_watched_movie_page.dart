import 'package:cinetrack/core/utils/format_date.dart';
import 'package:cinetrack/core/utils/show_snack.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/core/widget/button_submit.dart';
import 'package:cinetrack/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/add_watched_movie/add_watched_movie_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/add_watched_movie/add_watched_movie_state.dart';
import 'package:cinetrack/features/watched/presentation/bloc/watched_movie/watched_movie_bloc.dart';
import 'package:cinetrack/features/watched/presentation/widgets/date_watched_section.dart';
import 'package:cinetrack/features/watched/presentation/widgets/header_watched.dart';
import 'package:cinetrack/features/watched/presentation/widgets/movie_info_card.dart';
import 'package:cinetrack/features/watched/presentation/widgets/rating_section.dart';
import 'package:cinetrack/features/watched/presentation/widgets/review_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWatchedMoviePage extends StatefulWidget {
  const AddWatchedMoviePage({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.year,
  });

  final int id;
  final String image;
  final String title;
  final String year;

  @override
  State<AddWatchedMoviePage> createState() => _AddWatchedMoviePageState();
}

class _AddWatchedMoviePageState extends State<AddWatchedMoviePage> {
  double _rating = 5;
  final TextEditingController _reviewController = TextEditingController();
  DateTime? _watchedDate;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _selectWatchedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _watchedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.amber,
              surface: Color(0xFF364153),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _watchedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWatched(),
              const SizedBox(height: 25),
              MovieInfoCard(widget: widget),
              const SizedBox(height: 15),
              RatingSection(
                rating: _rating,
                onRatingChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              DateWatchedSection(
                watchedDate: _watchedDate,
                onTap: () {
                  _selectWatchedDate(context);
                },
              ),
              const SizedBox(height: 15),
              ReviewSection(controller: _reviewController),
              const SizedBox(height: 35),
              BlocConsumer<AddWatchedMovieBloc, AddWatchedMovieState>(
                listener: (context, state) {
                  if (state is AddWatchedMovieSuccess) {
                    context.read<WatchedMovieBloc>().fetchWatchedMovie();
                    context.read<HomeBloc>().loadHome();
                    showSnack(context, state.message);
                    Navigator.pop(context);
                  } else if (state is AddWatchedMovieFailure) {
                    showSnack(context, state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonSubmit(
                    title: 'Add to Watched Movie',
                    isLoading: state is AddWatchedMovieLoading,
                    onTap: () {
                      context.read<AddWatchedMovieBloc>().addWatchedMovie(
                        widget.id,
                        _rating,
                        formatDateToReadable(_watchedDate!.toIso8601String()),
                        _reviewController.text,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
