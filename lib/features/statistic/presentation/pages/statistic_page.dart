import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:cinetrack/features/statistic/presentation/bloc/statistic_state.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/favorite_genre_section.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/insights_section.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/movies_watched_section.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/rating_distribution_section.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/statistic_header.dart';
import 'package:cinetrack/features/statistic/presentation/widgets/statistic_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  void initState() {
    super.initState();
    context.read<StatisticBloc>().loadStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatisticHeader(),
                const SizedBox(height: 20),
                BlocBuilder<StatisticBloc, StatisticState>(
                  builder: (context, state) {
                    if (state is StatisticLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state is StatisticError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyle.xLargeWhiteBold,
                        ),
                      );
                    }

                    if (state is StatisticSuccess) {
                      final stats = state.statistic;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatisticSection(stats: stats),
                          const SizedBox(height: 20),
                          MoviesWatchedSection(stats: stats),
                          const SizedBox(height: 20),
                          FavoriteGenresSection(stats: stats),
                          const SizedBox(height: 20),
                          RatingDisributionSection(stats: stats),
                          const SizedBox(height: 20),
                          InsightsSection(insights: state.insights),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
