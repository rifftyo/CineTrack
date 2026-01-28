import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_reset_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_state.dart';

class VerifyResetPasswordBloc
    extends Bloc<VerifyResetPasswordEvent, VerifyResetPasswordState> {
  final VerifyResetPassword verifyResetPassword;

  VerifyResetPasswordBloc(this.verifyResetPassword)
    : super(VerifyResetPasswordInitial()) {
    on<VerifyResetPasswordSubmitted>(_onVerifyResetPasswordSubmitted);
  }

  Future<void> _onVerifyResetPasswordSubmitted(
    VerifyResetPasswordSubmitted event,
    Emitter<VerifyResetPasswordState> emit,
  ) async {
    if (event.code.isEmpty) {
      return emit(VerifyResetPasswordFailure('Code is not empty'));
    }

    emit(VerifyResetPasswordLoading());

    final result = await verifyResetPassword.execute(event.email, event.code);

    result.fold(
      (failure) => emit(VerifyResetPasswordFailure(failure.message)),
      (message) => emit(VerifyResetPasswordSuccess(message)),
    );
  }
}
