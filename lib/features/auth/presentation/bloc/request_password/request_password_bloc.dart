import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/request_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/request_password/request_password_state.dart';

class RequestPasswordBloc extends Cubit<RequestPasswordState> {
  final RequestPassword requestPassword;

  RequestPasswordBloc(this.requestPassword) : super(RequestPasswordInitial());

  Future<void> request({required String email}) async {
    if (email.isEmpty) {
      emit(RequestPasswordFailure('Email is required'));
      return;
    }

    emit(RequestPasswordLoading());

    final result = await requestPassword.execute(email);

    result.fold(
      (failure) => emit(RequestPasswordFailure(failure.message)),
      (_) => emit(RequestPasswordSuccess()),
    );
  }
}
