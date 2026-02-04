import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/register_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc(this.registerUser) : super(RegisterInitial());

  Future<void> register({
    required String fullname,
    required String username,
    required String email,
    required String password,
  }) async {
    if (fullname.isEmpty) {
      emit(RegisterFailure("Fullname is required"));
      return;
    }

    if (username.isEmpty) {
      emit(RegisterFailure("Username is required"));
      return;
    }

    final normalizedUsername = username.toLowerCase();
    final usernameValid = RegExp(r'^[a-z0-9_.]+$').hasMatch(normalizedUsername);

    if (!usernameValid) {
      emit(
        RegisterFailure(
          "Username must be lowercase and contain only letters, numbers, _ or .",
        ),
      );
      return;
    }

    if (email.isEmpty) {
      emit(RegisterFailure("Email is required"));
      return;
    }

    if (password.isEmpty) {
      emit(RegisterFailure("Password is required"));
      return;
    }

    emit(RegisterLoading());

    final result = await registerUser.execute(
      email,
      fullname,
      normalizedUsername,
      password,
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (message) => emit(RegisterSuccess(message)),
    );
  }
}
