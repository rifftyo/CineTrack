import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/login_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty) {
      emit(LoginFailure("Email is required"));
      return;
    }

    if (password.isEmpty) {
      emit(LoginFailure("Password is required"));
      return;
    }

    emit(LoginLoading());

    final result = await loginUser.execute(email, password);

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (message) => emit(LoginSuccess(message)),
    );
  }
}
