import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/statistic/domain/usecases/insights.dart';
import 'package:cinetrack/features/statistic/domain/usecases/statistics.dart';
import 'package:cinetrack/features/statistic/presentation/bloc/statistic_state.dart';

class StatisticBloc extends Cubit<StatisticState> {
  final Statistics statistics;
  final Insights insights;

  StatisticBloc({required this.statistics, required this.insights})
    : super(StatisticInitial());

  Future<void> loadStatistics() async {
    emit(StatisticLoading());

    final year = DateTime.now().year.toString();
    final statsResult = await statistics.execute(year);

    await statsResult.fold(
      (failure) async {
        emit(StatisticError(message: failure.message));
      },
      (statistic) async {
        final insightsResult = await insights.execute();

        insightsResult.fold(
          (failure) => emit(StatisticError(message: failure.message)),
          (insights) =>
              emit(StatisticSuccess(statistic: statistic, insights: insights)),
        );
      },
    );
  }
}
