import 'package:cinetrack/features/home/domain/entities/home_data.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeData data;

  HomeSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);

  @override
  List<Object?> get props => [error];
}
