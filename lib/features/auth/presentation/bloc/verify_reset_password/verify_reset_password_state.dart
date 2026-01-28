import 'package:equatable/equatable.dart';

abstract class VerifyResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyResetPasswordInitial extends VerifyResetPasswordState {}

class VerifyResetPasswordLoading extends VerifyResetPasswordState {}

class VerifyResetPasswordSuccess extends VerifyResetPasswordState {
  final String message;

  VerifyResetPasswordSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class VerifyResetPasswordFailure extends VerifyResetPasswordState {
  final String error;

  VerifyResetPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
