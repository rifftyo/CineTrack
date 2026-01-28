import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/reset_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPassword resetPassword;

  ResetPasswordBloc(this.resetPassword) : super(ResetPasswordInitial()) {
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  Future<void> _onResetPasswordSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    final result = await resetPassword.execute(
      event.email,
      event.code,
      event.newPassword,
    );

    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (message) => emit(ResetPasswordSuccess(message)),
    );
  }
}
