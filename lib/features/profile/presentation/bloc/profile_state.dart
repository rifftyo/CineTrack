import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User userData;

  ProfileSuccess({required this.userData});

  @override
  List<Object?> get props => [userData];
}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
