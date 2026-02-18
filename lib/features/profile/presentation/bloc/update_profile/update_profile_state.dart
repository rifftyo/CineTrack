import 'package:equatable/equatable.dart';

abstract class UpdateProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String message;

  UpdateProfileSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateProfileFailure extends UpdateProfileState {
  final String error;

  UpdateProfileFailure({required this.error});

  @override
  List<Object?> get props => [error];
}