import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/format_date.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/watched/presentation/bloc/watched_movie/watched_movie_bloc.dart';
import 'package:cinetrack/features/watched/presentation/bloc/watched_movie/watched_movie_state.dart';
import 'package:cinetrack/features/watched/presentation/widgets/watched_header_widget.dart';
import 'package:cinetrack/features/watched/presentation/widgets/watched_item_widget.dart';
import 'package:cinetrack/features/watched/presentation/widgets/watched_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchedMoviePage extends StatefulWidget {
  const WatchedMoviePage({super.key});

  @override
  State<WatchedMoviePage> createState() => _WatchedMoviePageState();
}

class _WatchedMoviePageState extends State<WatchedMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchedMovieBloc>().fetchWatchedMovie();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WatchedHeaderWidget(),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<WatchedMovieBloc, WatchedMovieState>(
                  builder: (context, state) {
                    if (state is WatchedMovieLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state is WatchedMovieFailure) {
                      return Center(
                        child: Text(
                          state.error,
                          style: AppTextStyle.xLargeWhiteBold,
                        ),
                      );
                    }

                    if (state is WatchedMovieSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WatchedSummaryWidget(watchedMovies: state.watched),
                          const SizedBox(height: 15),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.watched.length,
                              itemBuilder: (context, index) {
                                final watchedMovie = state.watched[index];
                                return WatchedItemWidget(
                                  watchedMovie: watchedMovie,
                                  watchedAt: formatDateToReadable(
                                    watchedMovie.watchedAt,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    return const SizedBox();
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
