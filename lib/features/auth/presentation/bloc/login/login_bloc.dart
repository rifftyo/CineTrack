import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/login_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (event.email.isEmpty) {
      return emit(LoginFailure("Email is required"));
    }

    if (event.password.isEmpty) {
      return emit(LoginFailure("Password is required"));
    }

    emit(LoginLoading());

    final result = await loginUser.execute(event.email, event.password);

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (message) => emit(LoginSuccess(message)),
    );
  }
}
