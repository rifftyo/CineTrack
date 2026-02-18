import 'package:bloc/bloc.dart';

abstract class AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthAuthenticated());

  void logout() {
    emit(AuthUnauthenticated());
  }

  void loginSuccess() {
    emit(AuthAuthenticated());
  }
}
