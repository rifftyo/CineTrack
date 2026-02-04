
import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_reset_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_reset_password/verify_reset_password_state.dart';
class VerifyResetPasswordBloc extends Cubit<VerifyResetPasswordState> {
  final VerifyResetPassword verifyResetPassword;

  VerifyResetPasswordBloc(this.verifyResetPassword)
    : super(VerifyResetPasswordInitial());

  Future<void> verify({required String email, required String code}) async {
    if (code.isEmpty) {
      emit(VerifyResetPasswordFailure('Code is not empty'));
      return;
    }

    emit(VerifyResetPasswordLoading());

    final result = await verifyResetPassword.execute(email, code);

    result.fold(
      (failure) => emit(VerifyResetPasswordFailure(failure.message)),
      (message) => emit(VerifyResetPasswordSuccess(message)),
    );
  }
}
