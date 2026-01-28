import 'package:equatable/equatable.dart';

abstract class VerifyUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyUserInitial extends VerifyUserState {}

class VerifyUserLoading extends VerifyUserState {}

class VerifyUserSuccess extends VerifyUserState {
  final String message;

  VerifyUserSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VerifyUserFailure extends VerifyUserState {
  final String error;

  VerifyUserFailure(this.error);

  @override
  List<Object?> get props => [error];
}
