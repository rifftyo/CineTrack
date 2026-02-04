import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/reset_password.dart';
import 'package:cinetrack/features/auth/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Cubit<ResetPasswordState> {
  final ResetPassword resetPassword;

  ResetPasswordBloc(this.resetPassword) : super(ResetPasswordInitial());

  Future<void> reset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());

    final result = await resetPassword.execute(email, code, newPassword);

    result.fold(
      (failure) => emit(ResetPasswordFailure(failure.message)),
      (message) => emit(ResetPasswordSuccess(message)),
    );
  }
}
