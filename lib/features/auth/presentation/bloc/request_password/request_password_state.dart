import 'package:equatable/equatable.dart';

abstract class RequestPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestPasswordInitial extends RequestPasswordState {}

class RequestPasswordLoading extends RequestPasswordState {}

class RequestPasswordSuccess extends RequestPasswordState {}

class RequestPasswordFailure extends RequestPasswordState {
  final String error;

  RequestPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
