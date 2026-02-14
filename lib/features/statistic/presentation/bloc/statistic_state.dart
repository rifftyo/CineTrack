import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:equatable/equatable.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object?> get props => [];
}

class StatisticInitial extends StatisticState {}

class StatisticLoading extends StatisticState {}

class StatisticSuccess extends StatisticState {
  final Statistic statistic;
  final List<String> insights;

  const StatisticSuccess({required this.statistic, required this.insights});

  @override
  List<Object?> get props => [statistic, insights];
}

class StatisticError extends StatisticState {
  final String message;

  const StatisticError({required this.message});

  @override
  List<Object?> get props => [message];
}
