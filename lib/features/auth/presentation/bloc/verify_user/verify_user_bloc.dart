import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/verify_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_user/verify_user_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/verify_user/verify_user_state.dart';

class VerifyUserBloc extends Bloc<VerifyUserEvent, VerifyUserState> {
  final VerifyUser verifyUser;

  VerifyUserBloc(this.verifyUser) : super(VerifyUserInitial()) {
    on<VerifyUserSubmitted>(_onVerifyUserSubmitted);
  }

  Future<void> _onVerifyUserSubmitted(
    VerifyUserSubmitted event,
    Emitter<VerifyUserState> emit,
  ) async {
    if (event.code.isEmpty) {
      return emit(VerifyUserFailure('Code is not empty'));
    }

    emit(VerifyUserLoading());

    final result = await verifyUser.execute(event.email, event.code);

    result.fold(
      (failure) => emit(VerifyUserFailure(failure.message)),
      (message) => emit(VerifyUserSuccess(message)),
    );
  }
}
