import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/request_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_state.dart';

class RequestPasswordBloc
    extends Bloc<RequestPasswordEvent, RequestPasswordState> {
  final RequestPassword requestPassword;

  RequestPasswordBloc(this.requestPassword) : super(RequestPasswordInitial()) {
    on<RequestPasswordSubmitted>(_onRequestPasswordSubmitted);
  }

  Future<void> _onRequestPasswordSubmitted(
    RequestPasswordSubmitted event,
    Emitter<RequestPasswordState> emit,
  ) async {
    if (event.email.isEmpty) {
      return emit(RequestPasswordFailure('Email is required'));
    }

    emit(RequestPasswordLoading());

    final result = await requestPassword.execute(event.email);

    result.fold(
      (failure) => emit(RequestPasswordFailure(failure.message)),
      (_) => emit(RequestPasswordSuccess()),
    );
  }
}
