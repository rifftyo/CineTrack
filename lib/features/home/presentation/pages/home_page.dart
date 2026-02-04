import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinetrack/features/home/presentation/bloc/home_state.dart';
import 'package:cinetrack/features/home/presentation/widgets/movie_sub.dart';
import 'package:cinetrack/features/home/presentation/widgets/statistic_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (state is HomeFailure) {
          return Center(
            child: Text(state.error, style: AppTextStyle.xLargeWhiteBold),
          );
        }

        if (state is HomeSuccess) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${state.data.profile.userName}',
                      style: AppTextStyle.xxxLargeWhiteBold.copyWith(
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'What will you watch today?',
                      style: AppTextStyle.xLargeWhite.copyWith(
                        color: Color(0xFF99A1AF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    StatisticSub(
                      totalWatched: state.data.statistic.totalWatched
                          .toString(),
                      avgRating: state.data.statistic.avgRating.toString(),
                    ),
                    const SizedBox(height: 35),
                    MovieSub(
                      title: 'Now Playing Movies',
                      movies: state.data.nowPlayingMovies,
                    ),
                    MovieSub(
                      title: 'Top Rated Movies',
                      movies: state.data.topRatedMovies,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
