import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_user/verify_user_state.dart';

class VerifyUserBloc extends Cubit<VerifyUserState> {
  final VerifyUser verifyUser;

  VerifyUserBloc(this.verifyUser) : super(VerifyUserInitial());

  Future<void> verify({required String email, required String code}) async {
    if (code.isEmpty) {
      emit(VerifyUserFailure('Code is not empty'));
      return;
    }

    emit(VerifyUserLoading());

    final result = await verifyUser.execute(email, code);

    result.fold(
      (failure) => emit(VerifyUserFailure(failure.message)),
      (message) => emit(VerifyUserSuccess(message)),
    );
  }
}
